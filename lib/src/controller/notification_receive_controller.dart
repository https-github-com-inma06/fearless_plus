import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

// TODO : 2021 06 12 할일 -> SharedPreferences 적용

/* 노티 수신 세그먼트 값 저장 */
class NotificationReceiveController extends GetxController {
  static bool isInstagram;
  static bool isTwitter;
  static bool isGalleryNotice;
  static bool isGalleryFund;
  static bool isGalleryEvent;
  static SharedPreferences prefs;

  @override
  void onInit() async {
    // 앱 시작시 내부 저장소에 저장된 셋팅값을 불러와 변수에 넣어준다.
    prefs = await SharedPreferences.getInstance(); // 내부저장소 인스턴스를 생성해 준다.

    if (prefs.getBool("Instagram") == null) {
      isInstagram = true;
      OneSignal().sendTag("Instagram", "1");
    } else {
      isInstagram = prefs.getBool("Instagram");
    }

    if (prefs.getBool("Twitter") == null) {
      isTwitter = true;
      OneSignal().sendTag("Twitter", "1");
    } else {
      isTwitter = prefs.getBool("Twitter");
    }

    if (prefs.getBool("GalleryNotice") == null) {
      isGalleryNotice = false;
      OneSignal().sendTag("GalleryNotice", "0");
    } else {
      isGalleryNotice = prefs.getBool("GalleryNotice");
    }

    if (prefs.getBool("GalleryFund") == null) {
      isGalleryFund = false;
      OneSignal().sendTag("GalleryFund", "0");
    } else {
      isGalleryFund = prefs.getBool("GalleryFund");
    }

    if (prefs.getBool("GalleryEvent") == null) {
      isGalleryEvent = false;
      OneSignal().sendTag("GalleryEvent", "0");
    } else {
      isGalleryEvent = prefs.getBool("GalleryEvent");
    }

    print('Instagram : $isInstagram');
    print('Twitter : $isTwitter');
    print('GalleryNotice : $isGalleryNotice');
    print('GalleryFund : $isGalleryFund');
    print('GalleryEvent : $isGalleryEvent');
    super.onInit();
  }

  @override
  void dispose() async {
    // prefs.setBool("Instagram", isInstagram);
    // prefs.setBool("Twitter", isTwitter);
    // prefs.setBool("GalleryNotice", isGalleryNotice);
    // prefs.setBool("GalleryFund", isGalleryFund);
    // prefs.setBool("GalleryEvent", isGalleryEvent);

    super.dispose();
  }
}
