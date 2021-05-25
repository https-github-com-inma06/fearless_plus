import 'package:get/get.dart';

enum RouteName {
  Calendar, // 일정
  Chart, // 음원차트
  Video, // 관련영상
  Campaign, // 이벤트, 광고
  Setting, // 셋팅
  Development,
}

class AppController extends GetxService {
  static AppController get to => Get.find();
  RxInt currentIndex = 2.obs; // 바텀네비게이션 인덱스 ( VIDEO )

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
