// To parse this JSON data, do
//
//     final updateProfile = updateProfileFromJson(jsonString);

import 'dart:convert';

import 'login_model.dart';

User updateProfileFromJson(String str) => User.fromJson(json.decode(str));

String updateProfileToJson(User data) => json.encode(data.toJson());
