// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

List<AttendanceModel> attendanceModelFromJson(String str) => List<AttendanceModel>.from(json.decode(str).map((x) => AttendanceModel.fromJson(x)));

String attendanceModelToJson(List<AttendanceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceModel {
  AttendanceModel({
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
  String? punchIn;
  String? punchOut;
  String punchDate;
  String classId;
  double lat;
  double lng;
  double punchDistance;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
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
