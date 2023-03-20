// To parse this JSON data, do
//
//     final createClassModel = createClassModelFromJson(jsonString);

import 'dart:convert';

CreateClassModel createClassModelFromJson(String str) => CreateClassModel.fromJson(json.decode(str));

String createClassModelToJson(CreateClassModel data) => json.encode(data.toJson());

class CreateClassModel {
  CreateClassModel({
    required this.id,
    required this.userId,
    required this.trainerName,
    required this.trainerId,
    required this.name,
    required this.address,
    required this.description,
    required this.establishDate,
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
  String establishDate;
  double lat;
  double lng;
  String startTime;
  List<double> location;
  String endTime;
  double rating;
  String createdAt;
  double distance;

  factory CreateClassModel.fromJson(Map<String, dynamic> json) => CreateClassModel(
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
