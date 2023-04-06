// To parse this JSON data, do
//
//     final samtitTypeModel = samtitTypeModelFromJson(jsonString);

import 'dart:convert';

List<SamtitTypeModel> samtitTypeModelFromJson(String str) => List<SamtitTypeModel>.from(json.decode(str).map((x) => SamtitTypeModel.fromJson(x)));

String samtitTypeModelToJson(List<SamtitTypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamtitTypeModel {
  SamtitTypeModel({
    required this.code,
    required this.name,
  });

  String code;
  String name;

  factory SamtitTypeModel.fromJson(Map<String, dynamic> json) => SamtitTypeModel(
    code: json["code"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
  };
}
