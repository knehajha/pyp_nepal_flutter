// To parse this JSON data, do
//
//     final atdScoreModel = atdScoreModelFromJson(jsonString);

import 'dart:convert';

AtdScoreModel atdScoreModelFromJson(String str) => AtdScoreModel.fromJson(json.decode(str));

String atdScoreModelToJson(AtdScoreModel data) => json.encode(data.toJson());

class AtdScoreModel {
  AtdScoreModel({
    required this.result,
    required this.att,
  });

  double result;
  int att;

  factory AtdScoreModel.fromJson(Map<String, dynamic> json) => AtdScoreModel(
    result: json["result"]?.toDouble(),
    att: json["att"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "att": att,
  };
}
