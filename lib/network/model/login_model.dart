// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
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
    required this.authToken,
    required this.password,
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
  String authToken;
  String password;
  bool isActive;
  bool isMobileVerified;
  bool isEmailVerified;
  DateTime createdDate;
  dynamic lastModifiedDate;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    authToken: json["authToken"],
    password: json["password"],
    isActive: json["isActive"],
    isMobileVerified: json["isMobileVerified"],
    isEmailVerified: json["isEmailVerified"],
    createdDate: DateTime.parse(json["createdDate"]),
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
    "authToken": authToken,
    "password": password,
    "isActive": isActive,
    "isMobileVerified": isMobileVerified,
    "isEmailVerified": isEmailVerified,
    "createdDate": createdDate.toIso8601String(),
    "lastModifiedDate": lastModifiedDate,
  };
}
