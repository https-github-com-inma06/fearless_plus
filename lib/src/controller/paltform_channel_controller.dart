import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PlatformChannelController extends GetxController {
  static const platform = const MethodChannel('atanasio.dev/method');
  String _batteryInfo;
  String _androidVersion;
  String _androidModelName;
  @override
  void onInit() {
    getBatteryLevel();
    getAndroidVersionName();
    getAndroidModelName();
    super.onInit();
  }


  Future<void> getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      _batteryInfo = '$result';

    } on PlatformException catch (e) {
      print('error : ${e.message}');
    }
  }

  Future<void> getAndroidVersionName() async {
    try {
      final String result = await platform.invokeMethod('getAndroidVersion');
      _androidVersion = '$result';

    } on PlatformException catch (e) {
      print('error : ${e.message}');
    }
  }

  Future<void> getAndroidModelName() async {
    try {
      final String result = await platform.invokeMethod('getAndroidModelName');
      _androidModelName = '$result';

    } on PlatformException catch (e) {
      print('error : ${e.message}');
    }
  }


  String get batteryLevel => _batteryInfo;
  String get androidVersionCode => _androidVersion;
  String get androidModelName => _androidModelName;

}
