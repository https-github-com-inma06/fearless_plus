import '../bottom_sheet/noti_bottom_sheet.dart';
import 'package:fearlessassemble/src/controller/app_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VideoAppBar extends GetView<AppController> {
  const VideoAppBar({Key key}) : super(key: key);

  Widget _title() {
    return Container(
      child: Text("Video"),
    );
  }

  Widget _actions() {
    return Container(
      child: GestureDetector(
        onTap: () {
          print("노티아이콘 클릭");
          Get.bottomSheet(
            NotiBottomSheet(),
            isScrollControlled: false,
          );
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
        SizedBox(
          width: 25,
        ),
        _title(),
        _actions(),
      ],
    );
  }
}
