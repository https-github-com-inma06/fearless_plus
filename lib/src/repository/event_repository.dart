import 'package:fearlessassemble/src/models/event_result.dart';
import 'package:get/get.dart';

class EventRepository extends GetConnect {
  static EventRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "http://13.209.32.248:19876/api/v1";
    super.onInit();
  }

  Future<EventResult> loadEvent() async {
    String url = "/events";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body["data"]["list"] != null &&
          response.body["data"]["list"].length > 0) {
        return EventResult.fromJson(response.body);
        //  utf8.decode(response.bodyBytes)
      }
    }
  }
}
