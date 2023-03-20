// To parse this JSON data, do
//
//     final joinClassModel = joinClassModelFromJson(jsonString);

import 'dart:convert';

JoinClassModel joinClassModelFromJson(String str) => JoinClassModel.fromJson(json.decode(str));

String joinClassModelToJson(JoinClassModel data) => json.encode(data.toJson());

class JoinClassModel {
  JoinClassModel({
    required this.message,
  });

  String message;

  factory JoinClassModel.fromJson(Map<String, dynamic> json) => JoinClassModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
