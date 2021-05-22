import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key key}) : super(key: key);

  Widget _logo() {
    return Row(
      children: [
        Container(
          child: Image.asset("assets/images/logo.png"),
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("영상모음"), // TODO: 페이지간 인자값 받아서 변경 예정
        ),
      ],
    );
  }

  Widget _actions() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 25,
            height: 25,
            child: SvgPicture.asset("assets/svg/icons/bell.svg"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 25,
              height: 25,
              child: SvgPicture.asset("assets/svg/icons/bell.svg"),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 25,
            height: 25,
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
          _actions(),
        ],
      ),
    );
  }
}
