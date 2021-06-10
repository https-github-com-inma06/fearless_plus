import 'dart:ui';

import 'package:fearlessassemble/src/components/bottom_sheet/bottom_sheet_widget.dart';
import 'package:fearlessassemble/src/pages/about.dart';
import 'package:fearlessassemble/src/pages/event.dart';
import 'package:fearlessassemble/src/pages/video.dart';
import 'package:fearlessassemble/src/repository/video_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget {
  final String title; // 앱바 타이틀
  final bool hasNewNotify; // 새로운 노티가 있으면 인디케이터 표시
  final String pageName;
  const CustomAppBar({
    Key key,
    this.title,
    this.hasNewNotify,
    this.pageName,
  }) : super(key: key);
  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  /*
   TODO: 나중에 클릭한것 안한것 색 변경하기
  *    */
  bool isTagBtnClick = false;
  final Color enabledFontColor = Color(0xFFFFFFFF);
  final Color disabledFontColor = Color(0xFFFF8B50);
  final Color enabledBackColor = Color(0xFFFF8B50);
  final Color disabledBackColor = Color(0xFFFFFFFF);

  @override
  void initState() {
    super.initState();
  }

  Widget _topTagView() {
    // TODO : API 받아온거로 처리해야함
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      width: 80,
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: 80,
            height: 30,
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  enabledBackColor,
                ),
              ),
              onPressed: () {
                print("버튼클릭됨");
              },
              child: Text(
                "음방",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: enabledFontColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: 80,
            height: 30,
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  enabledBackColor,
                ),
              ),
              onPressed: () {
                print("버튼클릭됨");
              },
              child: Text(
                "예능",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: enabledFontColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: 80,
            height: 30,
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  enabledBackColor,
                ),
              ),
              onPressed: () {
                print("버튼클릭됨");
              },
              child: Text(
                "라디오",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: enabledFontColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: 80,
            height: 30,
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  enabledBackColor,
                ),
              ),
              onPressed: () {
                print("버튼클릭됨");
              },
              child: Text(
                "직캠",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: enabledFontColor),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: 80,
            height: 30,
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  enabledBackColor,
                ),
              ),
              onPressed: () {
                print("버튼클릭됨");
              },
              child: Text(
                "유나👩",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: enabledFontColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _setting() {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("설정 톱니바퀴 클릭");
          Get.bottomSheet(
            BottomSheetWidget(
              title: 'Setting',
            ),
            isScrollControlled: true,
          );
        },
        child: Container(
          width: 25,
          height: 25,
          child: SvgPicture.asset("assets/svg/icons/ico_setting.svg"),
        ),
      ),
    );
  }

  Widget _notification() {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("설정 톱니바퀴 클릭");
          Get.bottomSheet(
            BottomSheetWidget(
              title: 'Notification',
            ),
            isScrollControlled: true,
          );
        },
        child: Container(
          width: 25,
          height: 25,
          child: widget.hasNewNotify == false
              ? SvgPicture.asset(
                  "assets/svg/icons/bell.svg") // if ( 새로운 노티가 없다면 ? )
              : SvgPicture.asset(
                  "assets/svg/icons/bell.svg"), // else ( 새로운 노티가 존재한다면 )
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text(widget.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.title) {
      case "Video":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 25,
                ),
                _title(),
                _notification(),
              ],
            ),
            // _topTagView(),  //TODO: 비디오 상단태그
          ],
        );
        break;
      case "Event":
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 25,
            ),
            _title(),
            _notification(),
          ],
        );
        break;
      case "Campaign":
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 25,
            ),
            _title(),
            _notification(),
          ],
        );
        break;
      case "About":
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _setting(),
            _title(),
            _notification(),
          ],
        );
        break;
      case "Chart":
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 25,
            ),
            _title(),
            _notification(),
          ],
        );
        break;
      case "Calendar":
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 25,
            ),
            _title(),
            _notification(),
          ],
        );
        break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 25,
        ),
        _title(),
        _notification(),
      ],
    );
  }
}
