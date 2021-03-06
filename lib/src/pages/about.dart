import 'package:fearlessassemble/src/components/about/about_widget.dart';
import 'package:fearlessassemble/src/components/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class About extends StatelessWidget {
  About({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomAppBar(
          title: 'About',
          hasNewNotify: false,
        ),
      ),
      body: Container(
        // margin: const EdgeInsets.only(
        //   left: 20,
        //   right: 20,
        // ),
        height: Get.height,
        child:
            AboutWidget(),
      ),
    );
  }
}
