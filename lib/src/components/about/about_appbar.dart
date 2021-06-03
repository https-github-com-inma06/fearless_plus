import '../bottom_sheet/noti_bottom_sheet.dart';
import 'package:fearlessassemble/src/controller/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AboutAppBar extends GetView<AppController> {
  const AboutAppBar({Key key}) : super(key: key);

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
          child: SvgPicture.asset("assets/svg/icons/setting.svg"),
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      child: Text("About BG"),
    );
  }

  Widget _actions() {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("노티아이콘 클릭");
          Get.bottomSheet(NotiBottomSheet());
        },
        child: Container(
          width: 25,
          height: 25,
          child: SvgPicture.asset("assets/svg/icons/bell.svg"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _setting(),
        _title(),
        _actions(),
      ],
    );
  }
}
