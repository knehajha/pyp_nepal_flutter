// To parse this JSON data, do
//
//     final fogotPassModel = fogotPassModelFromJson(jsonString);

import 'dart:convert';

ForgotPassModel forgotPassModelFromJson(String str) => ForgotPassModel.fromJson(json.decode(str));

String forgotPassModelToJson(ForgotPassModel data) => json.encode(data.toJson());

class ForgotPassModel {
  ForgotPassModel({
    required this.message,
  });

  String message;

  factory ForgotPassModel.fromJson(Map<String, dynamic> json) => ForgotPassModel(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,


  };
}
