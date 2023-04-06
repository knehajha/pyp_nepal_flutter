// To parse this JSON data, do
//
//     final punchInModel = punchInModelFromJson(jsonString);

import 'dart:convert';

PunchInModel punchInModelFromJson(String str) => PunchInModel.fromJson(json.decode(str));

String punchInModelToJson(PunchInModel data) => json.encode(data.toJson());

class PunchInModel {
  PunchInModel({
    required this.id,
    required this.userId,
    required this.punchIn,
    required this.punchOut,
    required this.punchDate,
    required this.classId,
    required this.lat,
    required this.lng,
    required this.punchDistance,
  });

  String id;
  String userId;
  String punchIn;
  String punchOut;
  String punchDate;
  String classId;
  double lat;
  double lng;
  double punchDistance;

  factory PunchInModel.fromJson(Map<String, dynamic> json) => PunchInModel(
    id: json["_id"],
    userId: json["userId"],
    punchIn: json["punchIn"],
    punchOut: json["punchOut"],
    punchDate: json["punchDate"],
    classId: json["classId"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    punchDistance: json["punchDistance"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "punchIn": punchIn,
    "punchOut": punchOut,
    "punchDate": punchDate,
    "classId": classId,
    "lat": lat,
    "lng": lng,
    "punchDistance": punchDistance,
  };
}
