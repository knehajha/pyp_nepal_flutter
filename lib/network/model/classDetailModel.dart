// To parse this JSON data, do
//
//     final classDetailModel = classDetailModelFromJson(jsonString);

import 'dart:convert';

ClassDetailModel classDetailModelFromJson(String str) => ClassDetailModel.fromJson(json.decode(str));

String classDetailModelToJson(ClassDetailModel data) => json.encode(data.toJson());

class ClassDetailModel {
  ClassDetailModel({
    required this.id,
    required this.userId,
    required this.trainerName,
    required this.trainerId,
    required this.name,
    required this.address,
    required this.description,
    this.establishDate,
    required this.lat,
    required this.lng,
    required this.startTime,
    required this.location,
    required this.endTime,
    required this.rating,
    required this.createdAt,
    required this.distance,
  });

  String id;
  String userId;
  String trainerName;
  String trainerId;
  String name;
  String address;
  String description;
  dynamic establishDate;
  double lat;
  double lng;
  String startTime;
  List<double> location;
  String endTime;
  int rating;
  String createdAt;
  int distance;

  factory ClassDetailModel.fromJson(Map<String, dynamic> json) => ClassDetailModel(
    id: json["_id"],
    userId: json["userId"],
    trainerName: json["trainerName"],
    trainerId: json["trainerId"],
    name: json["name"],
    address: json["address"],
    description: json["description"],
    establishDate: json["establishDate"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    startTime: json["startTime"],
    location: List<double>.from(json["location"].map((x) => x?.toDouble())),
    endTime: json["endTime"],
    rating: json["rating"],
    createdAt: json["createdAt"],
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "trainerName": trainerName,
    "trainerId": trainerId,
    "name": name,
    "address": address,
    "description": description,
    "establishDate": establishDate,
    "lat": lat,
    "lng": lng,
    "startTime": startTime,
    "location": List<dynamic>.from(location.map((x) => x)),
    "endTime": endTime,
    "rating": rating,
    "createdAt": createdAt,
    "distance": distance,
  };
}
