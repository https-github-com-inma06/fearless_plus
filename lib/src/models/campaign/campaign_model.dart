import 'dart:convert';

CampaignModel campaignFromJson(String str) =>
    CampaignModel.fromJson(json.decode(str));
String campaignToJson(CampaignModel data) => json.encode(data.toJson());

class CampaignModel {
  CampaignModel({
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
  });

  int id;
  String title;
  String startTime;
  String endTime;
  String description;
  String thumbnailImg;
  String url;
  String regDtm;
  String viewStart;
  String viewEnd;
  String isInProgress;
  String viewCal;
  String limitDay;
  String category;

  factory CampaignModel.fromJson(Map<String, dynamic> json) => CampaignModel(
        id: json["id"],
        title: json["title"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        description: json["description"],
        thumbnailImg: json["thumbnailImg"],
        url: json["url"],
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
        "regDtm": regDtm,
        "viewStart": viewStart,
        "viewEnd": viewEnd,
        "isInProgress": isInProgress,
        "viewCal": viewCal,
        "limitDay": limitDay,
        "category": category,
      };
}
