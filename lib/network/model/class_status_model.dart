// To parse this JSON data, do
//
//     final classStatusModel = classStatusModelFromJson(jsonString);

import 'dart:convert';

ClassStatusModel classStatusModelFromJson(String str) => ClassStatusModel.fromJson(json.decode(str));

String classStatusModelToJson(ClassStatusModel data) => json.encode(data.toJson());

class ClassStatusModel {
  ClassStatusModel({
    required this.id,
    required this.userId,
    required this.classId,
    required this.ownerId,
    required this.status,
    required this.createdAt,
  });

  String id;
  String userId;
  String classId;
  String ownerId;
  String status;
  String createdAt;

  factory ClassStatusModel.fromJson(Map<String, dynamic> json) => ClassStatusModel(
    id: json["_id"],
    userId: json["userId"],
    classId: json["classId"],
    ownerId: json["ownerId"],
    status: json["status"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "classId": classId,
    "ownerId": ownerId,
    "status": status,
    "createdAt": createdAt,
  };
}
