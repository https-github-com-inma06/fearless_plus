import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              "assets/svg/icons/bell.svg",
              color: Colors.black,
              height: 23,
              width: 23,
            ),
            onPressed: () {
              print("noti btn clicked");
            },
          ),
        ],
      ),
      body: Center(
        child: Text("Calendar"),
      ),
    );
  }
}
