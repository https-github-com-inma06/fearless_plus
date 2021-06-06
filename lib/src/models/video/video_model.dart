import 'dart:convert';

VideoModel videoFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
  VideoModel({
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

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
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
    this.videoCount,
  });

  int id;
  String title;
  int videoCount;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        title: json["title"],
        videoCount: json["videoCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "videoCount": videoCount,
      };
}
