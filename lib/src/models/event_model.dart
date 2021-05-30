import 'dart:convert';

EventModel eventFromJson(String str) => EventModel.fromJson(json.decode(str));
String eventToJson(EventModel data) => json.encode(data.toJson());

class EventModel {
  EventModel({
    this.id,
    this.title,
    this.startTime,
    this.endTime,
    this.description,
    this.image,
    this.url,
    this.regDtm,
    this.viewStart,
    this.viewEnd,
    this.isInProgress,
    this.viewCal,
  });

  String id;
  String title;
  String startTime;
  String endTime;
  String description;
  String image;
  String url;
  String regDtm;
  String viewStart;
  String viewEnd;
  String isInProgress;
  String viewCal;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        title: json["title"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        description: json["description"],
        image: json["image"],
        url: json["url"],
        regDtm: json["regDtm"],
        viewStart: json["viewStart"],
        viewEnd: json["viewEnd"],
        isInProgress: json["isInProgress"],
        viewCal: json["viewCal"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "startTime": startTime,
        "endTime": endTime,
        "description": description,
        "image": image,
        "url": url,
        "regDtm": regDtm,
        "viewStart": viewStart,
        "viewEnd": viewEnd,
        "isInProgress": isInProgress,
        "viewCal": viewCal,
      };
}
