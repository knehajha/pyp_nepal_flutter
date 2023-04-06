

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pyp_nepal/auth/login.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/network/model/login_model.dart';

const String keyStorage = "pyp_nepal_session";
final session = GetStorage(keyStorage);

List<String> myClassesIds = [];

 void saveUser(LoginModel data){
  // store user profile and their auth token
  String stringData = loginModelToJson(data);
  session.write("_user", stringData);
  session.write("_token", data.token);
}

 User? getProfile(){
  //Get user profile
  String? stringData = session.read("_user");
  LoginModel? loginModel = stringData != null ? loginModelFromJson(stringData) : null;
  return loginModel == null  ? null : loginModel.user;
 }

 String getAccessToken(){
  return session.read("_token");
 }

 void updatePunch(String classId){
  session.write("_punchClassId", classId);
 }

 String? getActivePunchClass(){
  return session.read("_punchClassId");
 }

 bool isLogin(){
  return getAccessToken()?.isNotEmpty ?? false;
 }

 void logout(){
  session.erase(); // Delete all stored keys and data
}