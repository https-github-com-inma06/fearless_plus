import 'package:fearlessassemble/src/models/campaign_model.dart';
import 'package:fearlessassemble/src/models/event_model.dart';

class EventResult {
  List<EventModel> lists;

  EventResult({
    this.lists,
  });
  factory EventResult.fromJson(Map<String, dynamic> json) => EventResult(
        lists: List<EventModel>.from(
            json["data"]["list"].map((data) => EventModel.fromJson(data))),
      );
}
