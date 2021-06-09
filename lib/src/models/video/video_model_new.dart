// To parse this JSON data, do
//
//     final videoModelNew = videoModelNewFromJson(jsonString);

import 'dart:convert';

VideoModelNew videoModelNewFromJson(String str) =>
    VideoModelNew.fromJson(json.decode(str));

String videoModelNewToJson(VideoModelNew data) => json.encode(data.toJson());

class VideoModelNew {
  VideoModelNew({
    this.code,
    this.message,
    this.datetime,
    this.data,
  });

  String code;
  String message;
  String datetime;
  Data data;

  factory VideoModelNew.fromJson(Map<String, dynamic> json) => VideoModelNew(
        code: json["code"],
        message: json["message"],
        datetime: json["datetime"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "datetime": datetime,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.nextYn,
    this.pageInfo,
    this.nextPageNum,
    this.list,
  });

  String nextYn;
  PageInfo pageInfo;
  int nextPageNum;
  List<ListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nextYn: json["nextYn"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        nextPageNum: json["nextPageNum"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nextYn": nextYn,
        "pageInfo": pageInfo.toJson(),
        "nextPageNum": nextPageNum,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.code,
    this.title,
    this.playTime,
    this.uploadDate,
    this.channelTitle,
    this.tags,
    this.thumbnailImg,
  });

  int id;
  String code;
  String title;
  String playTime;
  String uploadDate;
  String channelTitle;
  List<Tag> tags;
  String thumbnailImg;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        code: json["code"],
        title: json["title"],
        playTime: json["playTime"],
        uploadDate: json["uploadDate"],
        channelTitle: json["channelTitle"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        thumbnailImg: json["thumbnailImg"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "title": title,
        "playTime": playTime,
        "uploadDate": uploadDate,
        "channelTitle": channelTitle,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "thumbnailImg": thumbnailImg,
      };
}

class Tag {
  Tag({
    this.id,
    this.title,
  });

  int id;
  String title;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}

class PageInfo {
  PageInfo({
    this.page,
    this.size,
    this.total,
  });

  int page;
  int size;
  int total;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        page: json["page"],
        size: json["size"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "size": size,
        "total": total,
      };
}
