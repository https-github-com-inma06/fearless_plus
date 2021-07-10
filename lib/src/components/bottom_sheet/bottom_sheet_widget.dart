import 'package:fearlessassemble/src/controller/notification_receive_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

enum SheetName {
  Notification,
  Setting,
}

class BottomSheetWidget extends StatefulWidget {
  final String title;

  const BottomSheetWidget({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  BottomSheetWidgetState createState() => BottomSheetWidgetState();
}

class BottomSheetWidgetState extends State<BottomSheetWidget> {
  /*
  * Switch 변수
  * 내부저장소에 저장된 각각의 bool 값으로 설정한다.
  *
  * 만약, 내부저장소에 저장되어 있는 값이 없다면(null) - ( 앱 설치후 첫 구동 일때 )
  *
  * 기본 셋팅
  * SNS -> true
  * Gall -> false
  *
  * */
  bool _isInstagram;
  bool _isTwitter;
  bool _isGalleryNotice;
  bool _isGalleryFund;
  bool _isGalleryEvent;

  @override
  void initState() {
    /* 바텀 시트가 열릴때 전역 변수에 셋팅되어있던 값을
     ( 내부저장소에서 불러왔던 값) 내부 변수에 넣어준다 */
    // 인스타
    _isInstagram = NotificationReceiveController.isInstagram;
    // 인스타
    _isTwitter = NotificationReceiveController.isTwitter;
    // 인스타
    _isGalleryNotice = NotificationReceiveController.isGalleryNotice;
    // 인스타
    _isGalleryFund = NotificationReceiveController.isGalleryFund;
    // 인스타
    _isGalleryEvent = NotificationReceiveController.isGalleryEvent;

    print('_isInstagram : ${NotificationReceiveController.isInstagram}');
    print('_isTwitter : ${NotificationReceiveController.isTwitter}');
    print(
        '_isGalleryNotice : ${NotificationReceiveController.isGalleryNotice}');
    print('_isGalleryFund : ${NotificationReceiveController.isGalleryFund}');
    print('_isGalleryEvent : ${NotificationReceiveController.isGalleryEvent}');

    super.initState();
  }

  @override
  void dispose() async {
    /* 바텀 시트가 닫힐때 내부 변수에 있던 값을 내부 저장소에 (SharedPreferences) 저장한다 */
    NotificationReceiveController.prefs.setBool("Instagram", _isInstagram);
    NotificationReceiveController.prefs.setBool("Twitter", _isTwitter);
    NotificationReceiveController.prefs
        .setBool("GalleryNotice", _isGalleryNotice);
    NotificationReceiveController.prefs.setBool("GalleryFund", _isGalleryFund);
    NotificationReceiveController.prefs
        .setBool("GalleryEvent", _isGalleryEvent);

    NotificationReceiveController.isInstagram = _isInstagram;
    NotificationReceiveController.isTwitter = _isTwitter;
    NotificationReceiveController.isGalleryNotice = _isGalleryNotice;
    NotificationReceiveController.isGalleryFund = _isGalleryFund;
    NotificationReceiveController.isGalleryEvent = _isGalleryEvent;

    if (_isInstagram) {
      OneSignal().sendTag("Instagram", "1");
    } else {
      OneSignal().sendTag("Instagram", "0");
    }

    if (_isTwitter) {
      OneSignal().sendTag("Twitter", "1");
    } else {
      OneSignal().sendTag("Twitter", "0");
    }

    if (_isGalleryNotice) {
      OneSignal().sendTag("GalleryNotice", "1");
    } else {
      OneSignal().sendTag("GalleryNotice", "0");
    }

    if (_isGalleryFund) {
      OneSignal().sendTag("GalleryFund", "1");
    } else {
      OneSignal().sendTag("GalleryFund", "0");
    }

    if (_isGalleryEvent) {
      OneSignal().sendTag("GalleryEvent", "1");
    } else {
      OneSignal().sendTag("GalleryEvent", "0");
    }

    print('isTwitter : $_isTwitter');
    print(
        'NotificationReceiveController.isTwitter : ${NotificationReceiveController.isTwitter}');

    super.dispose();
    print('BottomSheet : dispose()');
  }

  /* 바텀시트 상단 바 */
  Widget _topBar() {
    return Container(
      child: SvgPicture.asset(
        'assets/svg/icons/bottom_sheet_bar.svg',
      ),
    );
  }

  /* 타이틀 */
  Widget _title() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Text(
        "Notify ${widget.title}",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _sns(String sectionTitle) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 10),
            child: Text(sectionTitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '인스타',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Container(
                child: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Color(0xFFFF8B50),
                    value: _isInstagram,
                    onChanged: (bool value) {
                      setState(() {
                        _isInstagram = value;
                        print("Instagram Switched : $_isInstagram");
                        // NotificationOption.setInstagram = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '트위터',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Container(
                child: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Color(0xFFFF8B50),
                    // value: widget.twitter,
                    value: _isTwitter,
                    onChanged: (bool value) {
                      // print('Twitter Switch State : $value');
                      // if (value) {
                      //   OneSignal().sendTag("Twitter", "1");
                      //   NotificationOption.setSpfs("Twitter", true);
                      // } else {
                      //   OneSignal().sendTag("Twitter", "0");
                      //   NotificationOption.setSpfs("Twitter", false);
                      // }
                      setState(
                        () {
                          _isTwitter = value;
                          print('Twitter Switched : $_isTwitter');
                          // NotificationOption.setTwitter = value;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dcGallery(String sectionTitle) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(sectionTitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '공지', // 갤러리
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Container(
                child: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Color(0xFFFF8B50),
                    // value: widget.gallNotice,
                    value: _isGalleryNotice,
                    onChanged: (bool value) {
                      // print('GalleryNotice Switch State : $value');
                      // if (value) {
                      //   OneSignal().sendTag("GalleryNotice", "1");
                      //   NotificationOption.setSpfs("GalleryNotice", true);
                      // } else {
                      //   OneSignal().sendTag("GalleryNotice", "0");
                      //   NotificationOption.setSpfs("GalleryNotice", false);
                      // }
                      setState(
                        () {
                          _isGalleryNotice = value;
                          print('Gallery Notice Switched : $_isGalleryNotice');
                          // NotificationOption.setGalleryNotice = value;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '모금', // 갤러리
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Container(
                child: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Color(0xFFFF8B50),
                    // value: widget.gallFund,
                    value: _isGalleryFund,
                    onChanged: (bool value) {
                      // print('GalleryFund Switch State : $value');
                      // if (value) {
                      //   OneSignal().sendTag("GalleryFund", "1");
                      //   NotificationOption.setSpfs("GalleryFund", true);
                      // } else {
                      //   OneSignal().sendTag("GalleryFund", "0");
                      //   NotificationOption.setSpfs("GalleryFund", false);
                      // }
                      setState(
                        () {
                          _isGalleryFund = value;
                          print('Gallery Fund Switched : $_isGalleryFund');
                          // NotificationOption.setGalleryFund = value;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '이벤트', // 갤러리
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Container(
                child: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Color(0xFFFF8B50),
                    // value: widget.gallEvent,
                    value: _isGalleryEvent,
                    onChanged: (bool value) {
                      // print('GalleryEvent Switch State : $value');
                      // if (value) {
                      //   OneSignal().sendTag("GalleryEvent", "1");
                      //   NotificationOption.setSpfs("GalleryEvent", true);
                      // } else {
                      //   OneSignal().sendTag("GalleryEvent", "0");
                      //   NotificationOption.setSpfs("GalleryEvent", false);
                      // }
                      setState(
                        () {
                          _isGalleryEvent = value;
                          print('GalleryEvent Switched : $_isGalleryEvent');
                          // NotificationOption.setGalleryEvent = value;
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /* 셋팅 바텀시트 */
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context.height / 1.65,
      margin: const EdgeInsets.only(
        left: 32,
        right: 32,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _topBar(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _title(),
                _sns(
                  'SNS',
                ),
                _dcGallery('Community'),
                // _officialCafe('공식카페'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*Widget _officialCafe(String sectionTitle) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(sectionTitle),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '공지', // 공식 팬카페
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Container(
                child: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Color(0xFFFF8B50),
                    value: _officialNoticeSwitch,
                    onChanged: (bool value) {
                      print(' Switch State : $value');
                      // if (value) {
                      //   OneSignal().sendTag("OfficialNotice", "1");
                      // } else {
                      //   OneSignal().sendTag("OfficialNotice", "0");
                      // }
                      setState(() {
                        _officialNoticeSwitch = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '이벤트', // 공식 팬카페
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Container(
                child: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    activeColor: Color(0xFFFF8B50),
                    value: _officialEventSwitch,
                    onChanged: (bool value) {
                      print(' Switch State : $value');
                      // if (value) {
                      //   OneSignal().sendTag("OfficialEvent", "1");
                      // } else {
                      //   OneSignal().sendTag("OfficialEvent", "0");
                      // }
                      setState(() {
                        _officialEventSwitch = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }*/

}
