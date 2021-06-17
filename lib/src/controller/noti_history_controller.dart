import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotiHistoryController extends GetxController {
  @override
  void onInit() async {
    SharedPreferences spf = await SharedPreferences.getInstance();
    String value = (spf.get("testString") as String);
    spf.setString("testString", "노티피케이션_1");
    print(value);
    super.onInit();
  }
}
