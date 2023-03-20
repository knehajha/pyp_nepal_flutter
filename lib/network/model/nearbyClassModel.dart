// To parse this JSON data, do
//
//     final nearbyClassModel = nearbyClassModelFromJson(jsonString);

import 'dart:convert';

List<NearbyClassModel> nearbyClassModelFromJson(String str) => List<NearbyClassModel>.from(json.decode(str).map((x) => NearbyClassModel.fromJson(x)));

String nearbyClassModelToJson(List<NearbyClassModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NearbyClassModel {
  NearbyClassModel({
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

  factory NearbyClassModel.fromJson(Map<String, dynamic> json) => NearbyClassModel(
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
