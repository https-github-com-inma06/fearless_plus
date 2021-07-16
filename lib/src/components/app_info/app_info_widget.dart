import 'package:fearlessassemble/src/controller/paltform_channel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInfoWidget extends GetView<PlatformChannelController> {
  const AppInfoWidget({Key key}) : super(key: key);

  Widget _systemInfo() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('배터리 잔량 : ${controller.batteryLevel} %'),
          Text('안드로이드 버전 : ${controller.androidVersionCode}'),
          Text('모델명 : ${controller.androidModelName}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: _systemInfo(),
      ),
    );
  }
}
