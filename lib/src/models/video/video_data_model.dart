import 'dart:convert';

VideoDataModel videoDataModelFromJson(String str) =>
    VideoDataModel.fromJson(json.decode(str));

String videoDataModelToJson(VideoDataModel data) => json.encode(data.toJson());

class VideoDataModel {
  VideoDataModel({
    this.data,
  });

  Data data;

  factory VideoDataModel.fromJson(Map<String, dynamic> json) => VideoDataModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.nextYn,
    this.pageInfo,
    this.nextPageNum,
  });

  String nextYn;
  PageInfo pageInfo;
  int nextPageNum;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nextYn: json["nextYn"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        nextPageNum: json["nextPageNum"],
      );

  Map<String, dynamic> toJson() => {
        "nextYn": nextYn,
        "pageInfo": pageInfo.toJson(),
        "nextPageNum": nextPageNum,
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
