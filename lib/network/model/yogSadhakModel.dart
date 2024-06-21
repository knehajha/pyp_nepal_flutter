

import 'dart:convert';

List<YogSadhakModel> yogSadhakModelFromJson(String str) => List<YogSadhakModel>.from(json.decode(str).map((x) => YogSadhakModel.fromJson(x)));

String yogSadhak(List<YogSadhakModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class YogSadhakModel {
  YogSadhakModel({
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
    required this.fcmToken,
    required this.password,
    required this.organization,
    required this.isActive,
    required this.isMobileVerified,
    required this.isEmailVerified,
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
  String fcmToken;
  String password;
  String organization;
  bool isActive;
  bool isMobileVerified;
  bool isEmailVerified;

  factory YogSadhakModel.fromJson(Map<String, dynamic> json) => YogSadhakModel(
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
    isEmailVerified: json["isEmailVerified"]
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
    "isEmailVerified": isEmailVerified
  };
}
