import 'package:get/get.dart';

enum RouteName {
  Calendar, // 일정
  Chart, // 음원차트
  Video, // 관련영상
  Event,
  Setting, // 셋팅
}

class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIndex = RouteName.Video.index.obs; // 첫 시작 메뉴

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
