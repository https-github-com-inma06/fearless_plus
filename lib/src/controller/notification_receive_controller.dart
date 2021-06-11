import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO : 2021 06 12 할일 -> SharedPreferences 적용
class NotificationReceiveController extends GetxController {
  @override
  void onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool testValue = (prefs.get("testBool") as bool);
    // prefs.setBool("testBool", true);
    print('testValue : ${testValue.toString()}');
    super.onInit();
  }
}
