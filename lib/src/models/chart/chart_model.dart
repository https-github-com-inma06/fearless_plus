// To parse this JSON data, do
//
//     final chartModel = chartModelFromJson(jsonString);

/*
*
* ChartModel ( list [ ... ] )
* ChartResult ( List<ChartModel> lists )
*
* */

import 'dart:convert';

ChartModel chartFromJson(String str) => ChartModel.fromJson(json.decode(str));

String chartToJson(ChartModel data) => json.encode(data.toJson());

class ChartModel {
  ChartModel({
    this.id,
    this.no,
    this.name,
    this.title,
    this.writeDate,
    this.dcUrl,
  });

  int id;
  String no;
  String name;
  String title;
  String writeDate;
  String dcUrl;

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        id: json["id"],
        no: json["no"],
        name: json["name"],
        title: json["title"],
        writeDate: json["writeDate"],
        dcUrl: json["dcUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "no": no,
        "name": name,
        "title": title,
        "writeDate": writeDate,
        "dcUrl": dcUrl,
      };
}
