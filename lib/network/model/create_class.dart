// To parse this JSON data, do
//
//     final createClassModel = createClassModelFromJson(jsonString);

import 'dart:convert';

CreateClassModel createClassModelFromJson(String str) => CreateClassModel.fromJson(json.decode(str));

String createClassModelToJson(CreateClassModel data) => json.encode(data.toJson());

class CreateClassModel {
  CreateClassModel({
    required this.address,
    required this.description,
    required this.distance,
    required this.endTime,
    required this.lat,
    required this.lng,
    required this.name,
    required this.startTime,
    required this.trainerId,
    required this.trainerName,
  });

  String address;
  String description;
  String distance;
  String endTime;
  String lat;
  String lng;
  String name;
  String startTime;
  String trainerId;
  String trainerName;

  factory CreateClassModel.fromJson(Map<String, dynamic> json) => CreateClassModel(
    address: json["address"],
    description: json["description"],
    distance: json["distance"],
    endTime: json["endTime"],
    lat: json["lat"],
    lng: json["lng"],
    name: json["name"],
    startTime: json["startTime"],
    trainerId: json["trainerId"],
    trainerName: json["trainerName"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "description": description,
    "distance": distance,
    "endTime": endTime,
    "lat": lat,
    "lng": lng,
    "name": name,
    "startTime": startTime,
    "trainerId": trainerId,
    "trainerName": trainerName,
  };
}
