import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:pyp_nepal/network/model/classDetailModel.dart';
import 'package:pyp_nepal/network/model/joinClassModel.dart';
import 'package:pyp_nepal/network/model/pendingClassModel.dart';
import 'package:pyp_nepal/util/app_preference.dart';

import 'Api_response.dart';
import 'package:http/http.dart' as http;

import 'model/createClassModel.dart';
import 'model/error_model.dart';
import 'model/fetchClass.dart';
import 'model/login_model.dart';
import 'model/nearbyClassModel.dart';
import 'model/registration_model.dart';



const baseUrl = "http://182.18.142.132:8080/pysn/";


Future<ApiResponse> signup(Map<String, dynamic> data) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var body = json.encode(data);
 final url = Uri.parse('${baseUrl}auth/register');
  final response =  await http.post(url, headers: {"Content-Type": "application/json", "device-ID":deviceId}, body: body);
  var isSuccess = response.statusCode == 200;
  print("signup=>>>> ${response.body}");
  var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
  var result = isSuccess ? registerModelFromJson(response.body) : null;
   return ApiResponse(isSuccess, message , result);
}


Future<ApiResponse> login(String userName,password) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var body= jsonEncode({"userName":userName,"password": password});
 final url = Uri.parse('${baseUrl}auth/login');
 final response = await http.post(url,headers: {"Content-Type": "application/json","device-ID":deviceId},body:body);

 var isSuccess = response.statusCode == 200;
 print("login=>>>> ${response.body}");
 var message = isSuccess ? "" : errorModelFromJson(response.body).message;
 var result = isSuccess ? loginModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message, result);
}

Future<ApiResponse> forgotPass(String userName) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 final url = Uri.parse('${baseUrl}auth/forgotPass?userName=$userName');
 final response = await http.post(url);
 var isSuccess = response.statusCode == 200;
 print("forgotPass=>>>> ${response.body}");
 var message = isSuccess ? "" : errorModelFromJson(response.body).message;
 var result = isSuccess ? loginModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message, result);
}


Future<ApiResponse>  createClass(Map<String, dynamic> data) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var body = json.encode(data);
 print("createClass Body=>>>> $body");
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass');
 final response = await http.post(url, headers: headers, body: body);
 var isSuccess = response.statusCode == 200;
 print("createClass=>>>> ${response.body}");
 var message = isSuccess ? "" : errorModelFromJson(response.body).message;
 var result = isSuccess ? createClassModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message, result);

   }


 Future<ApiResponse> fetchClass() async {
  String deviceId = await PlatformDeviceId.getDeviceId ?? "";
   var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("fetchClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result = isSuccess? fetchClassModelFromJson(response.body): null;
 return ApiResponse(isSuccess, message , result);
   }


Future<ApiResponse> nearbyClass(String lat, String lng) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/nearByClasses?lat=$lat&lng=$lng');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("nearbyClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess? nearbyClassModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message , result);
}


Future<ApiResponse> dashboardClass() async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}dashboard/');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("dashboardClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess? nearbyClassModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message , result);
}


Future<ApiResponse> joinClass(String classId) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/join?classId=$classId');
 final response =  await http.post(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("joinClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess? joinClassModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message , result);

}


Future<ApiResponse> classDetail(String classId) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/join?classId=$classId');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("joinClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess? classDetailModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message , result);

}

Future<ApiResponse> fetchRequestedClass() async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";

 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}/pending');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("joinClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess?  pendingClassModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message , result);

}



















