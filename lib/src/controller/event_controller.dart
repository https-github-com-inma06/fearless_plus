import 'package:fearlessassemble/src/models/event_result.dart';
import 'package:fearlessassemble/src/repository/event_repository.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  static EventController get to => Get.find();

  Rx<EventResult> eventResponseResult = EventResult().obs;

  @override
  void onInit() {
    _videoLoad();
    super.onInit();
  }

  void _videoLoad() async {
    EventResult eventResult = await EventRepository.to.loadEvent();
    print("event api response : ${eventResult.lists.length}");

    if (eventResult != null &&
        eventResult.lists != null &&
        eventResult.lists.length > 0) {
      eventResponseResult(eventResult);

    }
  }
}
