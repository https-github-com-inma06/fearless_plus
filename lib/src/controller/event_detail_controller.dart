import 'package:fearlessassemble/src/controller/event_controller.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController {
  EventController eventController;

  @override
  void onInit() {
    eventController = Get.find(tag: Get.parameters["title"]);
    super.onInit();
  }

  String get title => eventController.eventModel.title; // 제목
  String get startTime => eventController.eventModel.startTime; // 이벤트 시작일
  String get endTime => eventController.eventModel.endTime; // 종료일
  String get description => eventController.eventModel.description; // 상세설명
  String get thumbnailImg => eventController.eventModel.thumbnailImg; // 썸네일
  String get url => eventController.eventModel.url; // 링크 url
  String get shortDesc => eventController.eventModel.shortDesc; // 간략설명
}
