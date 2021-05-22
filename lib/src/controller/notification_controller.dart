import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  OneSignal _oneSignal = OneSignal();
  String oneSignalID = "6395ae43-f8e5-4862-b70a-da8402d413c8";
  FirebaseMessaging _messaging = FirebaseMessaging();
  RxMap<String, dynamic> message = Map<String, dynamic>().obs;

  @override
  void onInit() {
    _initOneSignal();
    _initNotification();
    _getToken();
    super.onInit();
  }

  /* Google FCM Setting Start */
  Future<void> _getToken() async {
    try {
      String token = await _messaging.getToken();
      print("token :  $token");
    } catch (e) {}
  }

  void _initNotification() {
    _messaging.requestNotificationPermissions(const IosNotificationSettings(
        sound: true, badge: true, alert: true, provisional: true));

    _messaging.configure(
      onMessage: _onMessage,
      onLaunch: _onLaunch,
      onResume: _onResume,
    );
  }

  Future<void> _onResume(Map<String, dynamic> message) {
    print("_onResume : $message");
    return null;
  }

  Future<void> _onLaunch(Map<String, dynamic> message) {
    print("_onLaunch : $message");
    _actionOnNotification(message);
    return null;
  }

  void _actionOnNotification(Map<String, dynamic> messageMap) {
    message(messageMap);
  }

  Future<void> _onMessage(Map<String, dynamic> message) {
    print("_onMessage : $message");
    return null;
  }

  /* Google FCM Setting End */

  /* OneSignal Setting Start */
  // OneSignal 초기화
  Future<void> _initOneSignal() async {
    _oneSignal.init(oneSignalID, iOSSettings: {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.inAppLaunchUrl: false,
    });
    _oneSignal.setInFocusDisplayType(OSNotificationDisplayType.notification);
    await _oneSignal.promptUserForPushNotificationPermission(
        fallbackToSettings: true);
  }
/* OneSignal SETTINGS END */
}
