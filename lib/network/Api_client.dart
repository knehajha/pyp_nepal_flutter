import 'dart:convert';

import 'Api_response.dart';
import 'package:http/http.dart' as http;

import 'model/create_class.dart';
import 'model/error_model.dart';
import 'model/login_model.dart';
import 'model/registration_model.dart';



const baseUrl = "http://182.18.142.132:8080/pysn/";

Future<ApiResponse> signup(Map<String, dynamic> data) async {
 var body = json.encode(data);
 final url = Uri.parse('${baseUrl}auth/register');
  final response =  await http.post(url, headers: {"Content-Type": "application/json"}, body:  body);
  var isSuccess = response.statusCode == 200;
  print("signup=>>>> ${response.body}");
  var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
  var result = registerModelFromJson(response.body);
   return ApiResponse(isSuccess, message , result);
}


Future<ApiResponse> login(String userName,password) async {
 var body= jsonEncode({"userName":userName,"password": password});
 final url = Uri.parse('${baseUrl}auth/login');
 final response = await http.post(url,headers: {"Content-Type": "application/json"},body:body);

 var isSuccess = response.statusCode == 200;
 print("login=>>>> ${response.body}");
 var message = isSuccess ? "" : errorModelFromJson(response.body).message;
 var result = loginModelFromJson(response.body);
 return ApiResponse(isSuccess, message, result);
}

Future<ApiResponse> forgotPass(String userName) async {
 final url = Uri.parse('${baseUrl}auth/forgotPass?userName=$userName');
 final response = await http.post(url);
 var isSuccess = response.statusCode == 200;
 print("forgotPass=>>>> ${response.body}");
 var message = isSuccess ? "" : errorModelFromJson(response.body).message;
 var result = loginModelFromJson(response.body);
 return ApiResponse(isSuccess, message, result);
}



Future<ApiResponse> createClass(Map<String, dynamic> data) async {
 final url = Uri.parse('${baseUrl}yogClass');
 final response = await http.post(url,headers: {"Content-Type": "application/json"});
 var isSuccess = response.statusCode == 200;
 print("createClass=>>>> ${response.body}");
 var message = isSuccess ? "" : errorModelFromJson(response.body).message;
 var result = createClassModelFromJson(response.body);
 return ApiResponse(isSuccess, message, result);

}


