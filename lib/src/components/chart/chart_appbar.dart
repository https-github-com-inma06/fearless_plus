import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChartAppBar extends StatelessWidget {
  final String title;
  const ChartAppBar({Key key, this.title}) : super(key: key);
  Widget _title() {
    return Container(
      child: Text("Campaign"),
    );
  }

  Widget _actions() {
    return Container(
      child: GestureDetector(
        onTap: () {},
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
