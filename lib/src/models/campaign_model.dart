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

  factory CampaignModel.fromJson(Map<String, dynamic> json) => CampaignModel(
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
