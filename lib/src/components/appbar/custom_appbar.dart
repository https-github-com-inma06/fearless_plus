import 'package:fearlessassemble/src/components/bottom_sheet/noti_bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatefulWidget {
  final String title; // 앱바 타이틀
  final bool hasNewNotify; // 새로운 노티가 있으면 인디케이터 표시
  final bool hasSetIcon; // 셋팅 아이콘 유무

  const CustomAppBar({
    Key key,
    this.title,
    this.hasNewNotify,
    this.hasSetIcon,
  }) : super(key: key);
  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  @override
  void initState() {
    super.initState();
  }

  Widget _setting() {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("설정 톱니바퀴 클릭");
          Get.bottomSheet(NotiBottomSheet());
        },
        child: Container(
          width: 25,
          height: 25,
          child: SvgPicture.asset("assets/svg/icons/ico_setting.svg"),
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text(widget.title),
    );
  }

  Widget _actions() {
    return Container(
      child: GestureDetector(
        onTap: () {},
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

  @override
  Widget build(BuildContext context) {
    return widget.hasSetIcon == false // 셋팅 아이콘 없을 경우
        ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 25,
            ),
            _title(),
            _actions(),
          ]) //셋팅아이콘 있을경우
        : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            _setting(),
            _title(),
            _actions(),
          ]);
  }
}
