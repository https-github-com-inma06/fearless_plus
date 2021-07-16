import 'package:fearlessassemble/src/components/about/about_widget.dart';
import 'package:fearlessassemble/src/components/app_info/app_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInfo extends StatelessWidget {
  AppInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Device Info'),
      ),
      body: Container(
        height: Get.height,
        child: Container(
          child: AppInfoWidget(),
        )
      ),
    );
  }
}
