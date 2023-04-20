// To parse this JSON data, do
//
//     final fetchRequestedClassModel = fetchRequestedClassModelFromJson(jsonString);

import 'dart:convert';

import 'login_model.dart';

List<FetchRequestedClassModel> fetchRequestedClassModelFromJson(String str) => List<FetchRequestedClassModel>.from(json.decode(str).map((x) => FetchRequestedClassModel.fromJson(x)));

String fetchRequestedClassModelToJson(List<FetchRequestedClassModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchRequestedClassModel {
  FetchRequestedClassModel({
    required this.user,
    required this.reqId,
    required this.req,
  });

  User user;
  String reqId;
  Req req;

  factory FetchRequestedClassModel.fromJson(Map<String, dynamic> json) => FetchRequestedClassModel(
    user: User.fromJson(json["user"]),
    reqId: json["reqId"],
    req: Req.fromJson(json["req"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "reqId": reqId,
    "req": req.toJson(),
  };
}

class Req {
  Req({
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
  int rating;
  String createdAt;
  int distance;

  factory Req.fromJson(Map<String, dynamic> json) => Req(
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