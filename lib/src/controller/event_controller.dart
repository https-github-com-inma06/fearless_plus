import 'package:fearlessassemble/src/models/event/event_model.dart';
import 'package:fearlessassemble/src/models/event/event_result.dart';
import 'package:fearlessassemble/src/repository/event_repository.dart';
import 'package:get/get.dart';

class EventController extends GetxController {
  // static EventController get to => Get.find();

  EventController({this.eventModel});
  EventModel eventModel;
  EventResult eventResult;
  Rx<EventResult> eventResponseResult = EventResult().obs;

  @override
  void onInit() async {
    _eventLoad();
    super.onInit();
  }

  void _eventLoad() async {
    EventResult eventResult = await EventRepository.to.loadEvent();

    if (eventResult != null &&
        eventResult.lists != null &&
        eventResult.lists.length > 0) {
      eventResponseResult(eventResult);
      print("event api response : ${eventResult.lists.length}");
    } else {
      print('event api is null');
    }
  }
}
