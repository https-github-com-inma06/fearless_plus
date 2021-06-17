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
    this.thumbnailImg,
    this.url,
    this.regDtm,
    this.viewStart,
    this.viewEnd,
    this.isInProgress,
    this.viewCal,
    this.limitDay,
    this.category,
    this.shortDesc,
  });

  int id;
  String title;
  String startTime;
  String endTime;
  String description;
  String thumbnailImg;
  String url;
  String shortDesc;
  String regDtm;
  String viewStart;
  String viewEnd;
  String isInProgress;
  String viewCal;
  String limitDay;
  String category;

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        title: json["title"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        description: json["description"],
        thumbnailImg: json["thumbnailImg"],
        url: json["url"],
        shortDesc: json["shortDesc"],
        regDtm: json["regDtm"],
        viewStart: json["viewStart"],
        viewEnd: json["viewEnd"],
        isInProgress: json["isInProgress"],
        viewCal: json["viewCal"],
        limitDay: json["limitDay"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "startTime": startTime,
        "endTime": endTime,
        "description": description,
        "thumbnailImg": thumbnailImg,
        "url": url,
        "shortDesc": shortDesc,
        "regDtm": regDtm,
        "viewStart": viewStart,
        "viewEnd": viewEnd,
        "isInProgress": isInProgress,
        "viewCal": viewCal,
        "limitDay": limitDay,
        "category": category,
      };
}
