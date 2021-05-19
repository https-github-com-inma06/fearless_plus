import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 노티 히스토리 테스트
    // Get.find()

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Setting"),
      ),
    );
  }
}
