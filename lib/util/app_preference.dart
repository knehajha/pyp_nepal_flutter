
import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pyp_nepal/auth/login.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/network/model/login_model.dart';

const String keyStorage = "pyp_nepal_session";
final session = GetStorage(keyStorage);
final welcomeSession =  GetStorage("com.bharuwa.nepalApp");

List<String> myClassesIds = [];

 void saveUser(LoginModel data){
  session.write("_user", jsonEncode(data));
  session.write("_token", data.token);
  }

  void storeCredentials(String username, String password){
   welcomeSession.write("_user_name", username);
   welcomeSession.write("_password", password);
  }


  String? getUserName(){
  return welcomeSession.read("_user_name");

  }

 String? getPassword(){
 return welcomeSession.read("_password");
 }


 void updateUser(User data){
 String? stringData = session.read("_user");
 LoginModel? loginModel = stringData != null ? loginModelFromJson(stringData) : null;
 if(loginModel != null){
  loginModel.user = data;
  String stringData = loginModelToJson(loginModel);
  session.write("_user", stringData);

  }
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

var samiti = [
 {
  "code": "1",
  "name": "Patanjali Yog Samiti, Nepal"
 },
 {
  "code": "2",
  "name": "Mahila Patanjali Yog Samiti, Nepal"
 },
 {
  "code": "3",
  "name": "Yuva Nepal Samiti"
 },
 {
  "code": "4",
  "name": "None"
   }

 ];

 String getOrganization(code){
 Map<String, String>? m = samiti.firstWhereOrNull((e) => code == e["code"]);
 return "${m?["name"]??""}";

 }

