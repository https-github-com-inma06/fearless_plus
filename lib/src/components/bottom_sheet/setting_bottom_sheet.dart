import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingBottomSheet extends StatelessWidget {
  const SettingBottomSheet({Key key}) : super(key: key);

  /* 바텀시트 헤더 */
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "셋팅셋팅",
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: Get.back,
        )
      ],
    );
  }

  /* 바텀시트 아이템 버튼 */
  Widget _itemButton(
      {String iconPath, double iconSize, String label, Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Center(
              child: Container(
                width: iconSize,
                height: iconSize,
                child: SvgPicture.asset("assets/svg/icons/$iconPath"),
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            _header(),
            SizedBox(height: 10),
            _itemButton(
                iconPath: "upload.svg",
                iconSize: 17,
                label: "셋팅셋팅",
                onTap: () {
                  print("셋팅셋팅 버튼 클릭");
                }),
            SizedBox(height: 10),
            _itemButton(
                iconPath: "broadcast.svg",
                iconSize: 25,
                label: "셋팅1111123123",
                onTap: () {
                  print("셋팅1111123123 클릭");
                }),
          ],
        ),
      ),
    );
  }
}