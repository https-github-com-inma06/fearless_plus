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
  @override
  void initState() {
    super.initState();
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
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        widget.title,
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
                    value: false,
                    onChanged: (bool value) {
                      // print('Instagram onChanged : $value');
                      // if (value) {
                      //   OneSignal().sendTag("Instagram", "1");
                      //   NotificationOption.setSpfs("Instagram", true);
                      //   print(
                      //       'Instagram OneSignal().sendTag("Instagram", "1")');
                      // } else {
                      //   OneSignal().sendTag("Instagram", "0");
                      //   NotificationOption.setSpfs("Instagram", false);
                      // }
                      setState(() {
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
                    value: false,
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
                    value: false,
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
                    value: false,
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
                    value: false,
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
      height: Get.context.height - (Get.context.height * 0.4),
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
                _dcGallery('브레이브걸스 갤러리'),
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
