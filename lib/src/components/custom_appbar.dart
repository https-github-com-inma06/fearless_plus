import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  const CustomAppBar({Key key, this.title}) : super(key: key);

  /* 로고 */
  Widget _logo() {
    return Container(
      child: Image.asset(
        "assets/images/logo.png",
      ),
    );
  }

  /* 타이틀 */
  Widget _title() {
    return Container(child: Text(this.title));
  }

  /* 노티피케이션 */
  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 23,
            height: 23,
            child: SvgPicture.asset("assets/svg/icons/bell.svg"),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _logo(),
        _title(),
        _actions(),
      ],
    ));
  }
}
