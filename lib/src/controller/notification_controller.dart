import 'dart:convert';

// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  OneSignal _oneSignal = OneSignal();
  String oneSignalID = "6395ae43-f8e5-4862-b70a-da8402d413c8";
  FirebaseMessaging _messaging = FirebaseMessaging();
  // FlutterLocalNotificationsPlugin _flutterLocalNoti = FlutterLocalNotificationsPlugin();
  RxMap<String, dynamic> message = Map<String, dynamic>().obs;
  @override
  void onInit() {
    // _initLocalNoti();
    _initOneSignal();
    _initNotification();
    _getToken();
    _receivedHandler();
    _openedHandler();
    _initSetLogLevel();
    super.onInit();
  }

  /* LOCAL NOTIFICATION START */
  // _initLocalNoti() {
  //   AndroidInitializationSettings androidInitSet =
  //       AndroidInitializationSettings('@mipmap/ic_launcher');
  //   IOSInitializationSettings iosInitSet = IOSInitializationSettings();
  //   InitializationSettings initSet =
  //       InitializationSettings(android: androidInitSet, iOS: iosInitSet);
  //
  //   _flutterLocalNoti.initialize(initSet,
  //       onSelectNotification: _onSelectLocalNoti);
  // }
  //
  // _printPayload(String payload) {
  //   print("_printPayload : $payload");
  // }
  //
  // Future<void> _onSelectLocalNoti(String payload) async {
  //   await _printPayload(payload);
  // }

  /* LOCAL NOTIFICATION END */

  // 노티 수신시
  _receivedHandler() {
    _oneSignal.setNotificationReceivedHandler((OSNotification notification) {
      // a notification has been received
      print(
          "_received androidNotificationId : ${notification.androidNotificationId}");
      print("_received appInFocus : ${notification.appInFocus}");
      print(
          "_received jsonRepresentation : ${notification.jsonRepresentation()}");
    });
  }

  // 노티 클릭시
  _openedHandler() {
    _oneSignal
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // a notification has been opened
      //
      // NotiData notiData = NotiData.fromJson(
      //     jsonDecode(result.notification.jsonRepresentation()));
      // print("NotiData : ${notiData}");

      if (result.notification.payload.launchUrl?.isNotEmpty) {
        launchUrlParser(result.notification.payload.launchUrl);
      }
    });
  }

  launchUrlParser(String scheme) async {
    // launchUrl

    if (scheme.startsWith("fearless://")) {}
  }

  _initSetLogLevel() {
    _oneSignal.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  }

  /* OneSignal Setting Start */
  // OneSignal 초기화
  Future<void> _initOneSignal() async {
    _oneSignal.init(oneSignalID, iOSSettings: {
      OSiOSSettings.autoPrompt: false,
      OSiOSSettings.inAppLaunchUrl: false,
    });
    /*
    * none -> Foreground 일때 노티X (데이터는 수신)
    * notification -> Foreground & Background & Terminated 모두 노티
    * alert -> Foreground 일때 AlertDialog ( 커스텀x )
    * */
    _oneSignal.setInFocusDisplayType(OSNotificationDisplayType.notification);
    await _oneSignal.promptUserForPushNotificationPermission(
        fallbackToSettings: true);
  }
/* OneSignal SETTINGS END */

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

}
