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
  @override
  void initState() {
    super.initState();
  }

  /* 바텀시트 상단 바 */
  Widget _topBar() {
    return Container(
      margin: const EdgeInsets.only(
        top: 5,
      ),
      child: SvgPicture.asset(
        'assets/svg/icons/bottom_sheet_bar.svg',
      ),
    );
  }

  /* 바텀시트 헤더 타이틀 */
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: Get.back,
        ),
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
    return Container(
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
          height: 600,
          color: Colors.white,
          child: Container(
            margin: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              children: [
                _topBar(),
                _header(),
                SizedBox(height: 20),
                _itemButton(
                    iconPath: "bell.svg",
                    iconSize: 17,
                    label: "ddddddd",
                    onTap: () {
                      print("111111111");
                    }),
                SizedBox(height: 10),
                _itemButton(
                    iconPath: "bell.svg",
                    iconSize: 25,
                    label: "zzzzzzzzzzzzzzzz",
                    onTap: () {
                      print("22222222222222");
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
