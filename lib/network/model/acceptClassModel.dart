
// To parse this JSON data, do
//
//     final acceptClassModel = acceptClassModelFromJson(jsonString);

import 'dart:convert';

AcceptClassModel acceptClassModelFromJson(String str) => AcceptClassModel.fromJson(json.decode(str));

String acceptClassModelToJson(AcceptClassModel data) => json.encode(data.toJson());

class AcceptClassModel {
  AcceptClassModel({
    required this.message,
  });

  String message;

  factory AcceptClassModel.fromJson(Map<String, dynamic> json) => AcceptClassModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}

