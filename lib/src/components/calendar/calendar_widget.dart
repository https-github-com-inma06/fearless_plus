import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("캘린더입니다"),
      ),
    );
  }
}
