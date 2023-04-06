// To parse this JSON data, do
//
//     final monthAtdModel = monthAtdModelFromJson(jsonString);

import 'dart:convert';

List<MonthAtdModel> monthAtdModelFromJson(String str) => List<MonthAtdModel>.from(json.decode(str).map((x) => MonthAtdModel.fromJson(x)));

String monthAtdModelToJson(List<MonthAtdModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MonthAtdModel {
  MonthAtdModel({
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

  factory MonthAtdModel.fromJson(Map<String, dynamic> json) => MonthAtdModel(
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
