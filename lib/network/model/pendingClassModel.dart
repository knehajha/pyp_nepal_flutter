// To parse this JSON data, do
//
//     final pendingClassModel = pendingClassModelFromJson(jsonString);

import 'dart:convert';

List<PendingClassModel> pendingClassModelFromJson(String str) => List<PendingClassModel>.from(json.decode(str).map((x) => PendingClassModel.fromJson(x)));

String pendingClassModelToJson(List<PendingClassModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PendingClassModel {
  PendingClassModel({
    required this.user,
    required this.req,
  });

  User user;
  Req req;

  factory PendingClassModel.fromJson(Map<String, dynamic> json) => PendingClassModel(
    user: User.fromJson(json["user"]),
    req: Req.fromJson(json["req"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
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

class User {
  User({
    required this.id,
    required this.name,
    required this.fatherOrHusbandName,
    required this.userType,
    required this.mobileNumber,
    required this.dateOfBirth,
    required this.maritalStatus,
    required this.image,
    required this.email,
    required this.gender,
    required this.address,
    required this.state,
    required this.district,
    required this.city,
    required this.pincode,
    this.fcmToken,
    this.password,
    required this.organization,
    required this.isActive,
    required this.isMobileVerified,
    required this.isEmailVerified,
    required this.createdDate,
    this.lastModifiedDate,
  });

  String id;
  String name;
  String fatherOrHusbandName;
  String userType;
  String mobileNumber;
  String dateOfBirth;
  String maritalStatus;
  String image;
  String email;
  String gender;
  String address;
  String state;
  String district;
  String city;
  String pincode;
  dynamic fcmToken;
  dynamic password;
  String organization;
  bool isActive;
  bool isMobileVerified;
  bool isEmailVerified;
  String createdDate;
  dynamic lastModifiedDate;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    fatherOrHusbandName: json["fatherOrHusbandName"],
    userType: json["userType"],
    mobileNumber: json["mobileNumber"],
    dateOfBirth: json["dateOfBirth"],
    maritalStatus: json["maritalStatus"],
    image: json["image"],
    email: json["email"],
    gender: json["gender"],
    address: json["address"],
    state: json["state"],
    district: json["district"],
    city: json["city"],
    pincode: json["pincode"],
    fcmToken: json["fcmToken"],
    password: json["password"],
    organization: json["organization"],
    isActive: json["isActive"],
    isMobileVerified: json["isMobileVerified"],
    isEmailVerified: json["isEmailVerified"],
    createdDate: json["createdDate"],
    lastModifiedDate: json["lastModifiedDate"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "fatherOrHusbandName": fatherOrHusbandName,
    "userType": userType,
    "mobileNumber": mobileNumber,
    "dateOfBirth": dateOfBirth,
    "maritalStatus": maritalStatus,
    "image": image,
    "email": email,
    "gender": gender,
    "address": address,
    "state": state,
    "district": district,
    "city": city,
    "pincode": pincode,
    "fcmToken": fcmToken,
    "password": password,
    "organization": organization,
    "isActive": isActive,
    "isMobileVerified": isMobileVerified,
    "isEmailVerified": isEmailVerified,
    "createdDate": createdDate,
    "lastModifiedDate": lastModifiedDate,
  };
}
