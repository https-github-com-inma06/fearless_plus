// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fearlessassemble/extension.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class NotificationController extends GetxController {
  static NotificationController get to => Get.find();
  OneSignal _oneSignal = OneSignal();
  // String oneSignalID = "6395ae43-f8e5-4862-b70a-da8402d413c8"; // Android Old ver
  // String oneSignalID = "bc816451-e2cd-4ad7-aed0-2f8795055d44"; // Android
  String oneSignalID = "9b8d1a77-41a9-4ff4-a598-644d1be1f3f3"; // Android 최신
  // String oneSignalID = "8eadf95f-a1ad-47db-97f3-a9aa43c1fc50"; // iOS
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
    String _launchUrl = "";

    _oneSignal
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      // a notification has been opened
      //
      // NotiData notiData = NotiData.fromJson(
      //     jsonDecode(result.notification.jsonRepresentation()));
      // print("NotiData : ${notiData}");

      if (result.notification.payload.launchUrl != null) {
        _launchUrl = result.notification.payload.launchUrl.toString();
        print('result launchUrl : ${result.notification.payload.launchUrl}');
        try {
          LaunchInBrowser().launchInBrowser(_launchUrl);
          // launchUrlParser(result.notification.payload.launchUrl);
        } catch (e) {
          print('Error : $e');
          print('Check UnInstall Dc App : $_launchUrl');
        }
      }
    });
  }

  launchUrlParser(String scheme) async {
    // launchUrl
    print('launchUrlParser');
    if (scheme.startsWith("fearless://")) {}
  }

  _initSetLogLevel() {
    print('_initSetLogLevel');
    _oneSignal.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  }

  /* OneSignal Setting Start */
  // OneSignal 초기화
  Future<void> _initOneSignal() async {
    _oneSignal.init(oneSignalID, iOSSettings: {
      OSiOSSettings.autoPrompt: false, // 푸시 인증
      OSiOSSettings.inAppLaunchUrl: false, // 웹으로 바로 연결
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
