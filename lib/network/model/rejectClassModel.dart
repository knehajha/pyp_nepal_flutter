// To parse this JSON data, do
//
//     final rejectClassModel = rejectClassModelFromJson(jsonString);

import 'dart:convert';

RejectClassModel rejectClassModelFromJson(String str) => RejectClassModel.fromJson(json.decode(str));

String rejectClassModelToJson(RejectClassModel data) => json.encode(data.toJson());

class RejectClassModel {
  RejectClassModel({
    required this.message,
  });

  String message;

  factory RejectClassModel.fromJson(Map<String, dynamic> json) => RejectClassModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
