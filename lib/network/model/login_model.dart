// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user.toJson(),
    "token": token,
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
    required this.password,
    this.organigation,
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
  String password;
  dynamic organigation;
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
    organigation: json["organigation"],
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
    "organigation": organigation,
    "isActive": isActive,
    "isMobileVerified": isMobileVerified,
    "isEmailVerified": isEmailVerified,
    "createdDate": createdDate,
    "lastModifiedDate": lastModifiedDate,
  };
}