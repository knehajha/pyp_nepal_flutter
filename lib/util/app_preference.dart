

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pyp_nepal/auth/login.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/network/model/login_model.dart';

const String keyStorage = "pyp_nepal_session";
final session = GetStorage(keyStorage);

void saveUser(LoginModel data){
  // store user profile and their auth token
  String stringData = loginModelToJson(data);
  session.write("_user", stringData);
  session.write("_token", data.token);
}

User? getProfile(){
  //Get user profile
  String stringData = session.read("_user");
  LoginModel loginModel = loginModelFromJson(stringData);
  return loginModel?.user;
}

String getAccessToken(){
  return session.read("_token");
}

bool isLogin(){
  return getAccessToken()?.isNotEmpty ?? false;
}

void logout(){
  session.erase(); // Delete all stored keys and data
}