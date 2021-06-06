import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

enum SheetName {
  Notification,
  Setting,
}

class BottomSheetWidget extends StatefulWidget {
  final String title;
  const BottomSheetWidget({Key key, this.title}) : super(key: key);
  @override
  BottomSheetWidgetState createState() => BottomSheetWidgetState();
}

class BottomSheetWidgetState extends State<BottomSheetWidget> {
  /* SNS Switch Status */
  bool _instaSwitch = false;
  bool _twitterSwitch = false;

  /* 공식카페 Switch Status */
  bool _officialNoticeSwitch = false;
  bool _officialEventSwitch = false;

  /* 브레이브걸스 갤러리 Switch Status */
  bool _dcNoticeSwitch = false;
  bool _dcEventSwitch = false;
  bool _dcFunding = false;

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
            margin: const EdgeInsets.only(top: 20, bottom: 10),
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
              CupertinoSwitch(
                activeColor: Color(0xFFFF8B50),
                value: _instaSwitch,
                onChanged: (bool value) {
                  print(' Switch State : $value');
                  setState(() {
                    _instaSwitch = value;
                  });
                },
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
              CupertinoSwitch(
                activeColor: Color(0xFFFF8B50),
                value: _twitterSwitch,
                onChanged: (bool value) {
                  print(' Switch State : $value');
                  setState(() {
                    _twitterSwitch = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _officialCafe(String sectionTitle) {
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
                '공지',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              CupertinoSwitch(
                activeColor: Color(0xFFFF8B50),
                value: _officialNoticeSwitch,
                onChanged: (bool value) {
                  print(' Switch State : $value');
                  setState(() {
                    _officialNoticeSwitch = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '이벤트',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              CupertinoSwitch(
                activeColor: Color(0xFFFF8B50),
                value: _officialEventSwitch,
                onChanged: (bool value) {
                  print(' Switch State : $value');
                  setState(() {
                    _officialEventSwitch = value;
                  });
                },
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
                '공지',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              CupertinoSwitch(
                activeColor: Color(0xFFFF8B50),
                value: _dcNoticeSwitch,
                onChanged: (bool value) {
                  print(' Switch State : $value');
                  setState(() {
                    _dcNoticeSwitch = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '모금',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              CupertinoSwitch(
                activeColor: Color(0xFFFF8B50),
                value: _dcFunding,
                onChanged: (bool value) {
                  print(' Switch State : $value');
                  setState(() {
                    _dcFunding = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '이벤트',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              CupertinoSwitch(
                activeColor: Color(0xFFFF8B50),
                value: _dcEventSwitch,
                onChanged: (bool value) {
                  print(' Switch State : $value');
                  setState(() {
                    _dcEventSwitch = value;
                  });
                },
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
      height: Get.context.height - (Get.context.height * 0.235),
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
                _officialCafe(
                  '공식카페',
                ),
                _dcGallery('브레이브걸스 갤러리'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
