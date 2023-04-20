import 'dart:convert';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:pyp_nepal/network/model/acceptClassModel.dart';
import 'package:pyp_nepal/network/model/atdScoreModel.dart';
import 'package:pyp_nepal/network/model/classDetailModel.dart';
import 'package:pyp_nepal/network/model/joinClassModel.dart';
import 'package:pyp_nepal/network/model/pendingClassModel.dart';
import 'package:pyp_nepal/network/model/rejectClassModel.dart';
import 'package:pyp_nepal/util/app_preference.dart';
import 'Api_response.dart';
import 'package:http/http.dart' as http;
import 'model/CurrentAtdModel.dart';
import 'model/class_status_model.dart';
import 'model/monthAtdModel.dart';
import 'model/punchInModel.dart';
import 'model/createClassModel.dart';
import 'model/dashboardClassModel.dart';
import 'model/error_model.dart';
import 'model/fetchClass.dart';
import 'model/login_model.dart';
import 'model/nearbyClassModel.dart';
import 'model/punchOutModel.dart';
import 'model/registration_model.dart';
import 'model/samitiTypeModel.dart';
import 'model/update_profile_model.dart';
import 'model/uploadImageModel.dart';
import 'model/yogSadhakModel.dart';



const baseUrl = "http://182.18.142.132:8080/pysn/";
const imageUrl = "http://182.18.142.132:8080/pyp-img/";


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


Future<ApiResponse> login(userName, password, fcmToken) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var body= jsonEncode({"userName":userName,"password": password, "fcmToken": fcmToken});
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
 // var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/nearByClasses?lat=$lat&lng=$lng');
 final response =  await http.get(url);
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
 var result =  isSuccess? dashboardClassModelFromJson(response.body) : null;
 return ApiResponse(isSuccess,message,result);
}


Future<ApiResponse> classDetail(String classId) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/classId=$classId');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("classDetail=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess? classDetailModelFromJson(response.body) : null;
 return ApiResponse(isSuccess,message,result);

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
 return ApiResponse(isSuccess,message,result);

}
Future<ApiResponse> fetchRequestedClass() async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";

 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/pending');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("joinClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess?  pendingClassModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message , result);

}

Future<ApiResponse> acceptClass(String reqId) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";

 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/accept?id=$reqId');
 final response =  await http.put(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("acceptClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess?  acceptClassModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message , result);

}


 Future<ApiResponse> rejectClass(String reqId) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";

 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/reject?id=$reqId');
 final response =  await http.put(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("rejectClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess?  rejectClassModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message , result);

    }

 Future<ApiResponse> punchIn(Map<String, dynamic> data) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var body = json.encode(data);
 final url = Uri.parse('${baseUrl}attendance/punch-in');
 final response =  await http.post(url, headers: {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json", "device-ID":deviceId}, body: body);
 var isSuccess = response.statusCode == 200;
 print("punchIn=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result = isSuccess ? punchInModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message , result);
 }

 Future<ApiResponse> punchOut(String classId) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}attendance/punch-out?classId=$classId');
 final response =  await http.post(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("punchOut=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result =  isSuccess? punchOutModelFromJson(response.body) : null;
 return ApiResponse(isSuccess,message,result);

   }

 Future<ApiResponse> currentAttendance(String classId) async {
  String deviceId = await PlatformDeviceId.getDeviceId ?? "";
  var headers = {
   "Authorization": "Bearer ${getAccessToken()}",
   "Content-Type": "application/json",
   "device-ID": deviceId
  };
  final url = Uri.parse('${baseUrl}attendance/attendance?classId=$classId');
  final response = await http.get(url, headers: headers);
  var isSuccess = response.statusCode == 200;
  print("CurrentAttendance=>>>> ${response.body}");
  var message = isSuccess ? "" : errorModelFromJson(response.body).message;
  var result = isSuccess ? attendanceModelFromJson(response.body) : null;
  return ApiResponse(isSuccess, message, result);

 }

Future<ApiResponse> monthlyAttendance(String classId, String date) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
  var headers = {
  "Authorization": "Bearer ${getAccessToken()}",
  "Content-Type": "application/json",
  "device-ID": deviceId
 };
 final url = Uri.parse('${baseUrl}attendance/attendanceByMonth?classId=$classId&date=$date');
 final response = await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("MonthlyAttendance=>>>> ${response.body}");
 var message = isSuccess ? "" : errorModelFromJson(response.body).message;
 var result = isSuccess ? monthAtdModelFromJson(response.body) : null;
 return ApiResponse(isSuccess, message, result);
}

Future<ApiResponse> uploadImage(String imagePath) async {
 var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}assets/upload'));
 request.files.add(await http.MultipartFile.fromPath('file', imagePath));
 http.StreamedResponse response = await request.send();
 String str = await response.stream.bytesToString();
 var isSuccess = response.statusCode == 200;
 var message = isSuccess ? "" : errorModelFromJson(str).message;
 var result = isSuccess ? uploadImageModelFromJson(str) : null;
 return ApiResponse(isSuccess, message, result);
}

Future<ApiResponse> samitiType() async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 final url = Uri.parse('${baseUrl}assets/samitiTypes');
 final response =  await http.get(url);
 var isSuccess = response.statusCode == 200;
 print("samitiType=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result = isSuccess? samtitTypeModelFromJson(response.body): null;
 return ApiResponse(isSuccess, message , result);
}

 Future<ApiResponse> getClassStatus(classId) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/status?classId=$classId');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("getClassStatus=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result = isSuccess? classStatusModelFromJson(response.body): null;
 return ApiResponse(isSuccess, message , result);
}

 Future<ApiResponse> getYogSadhaks() async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass/sadhak');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("getYogSadhak=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result = isSuccess? yogSadhakModelFromJson(response.body): null;
 return ApiResponse(isSuccess, message , result);
 }



Future<ApiResponse> updateProfile(User user) async {
 var body = json.encode(user);
 var token = getAccessToken();
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer $token", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}user');
 final response =  await http.put(url, headers: headers, body: body);
 var isSuccess = response.statusCode == 200;
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result = isSuccess? updateProfileFromJson(response.body): null;
 return ApiResponse(isSuccess, message , result);
}

Future<ApiResponse> updateClass(FetchClassModel myClass) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var body = json.encode(myClass);
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}yogClass');
 final response =  await http.put(url, headers: headers, body: body);
 var isSuccess = response.statusCode == 200;
 print("updateClass=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result = isSuccess? classDetailModelFromJson(response.body): null;
 return ApiResponse(isSuccess, message , result);

}


 Future<ApiResponse> getAtdScore([String classId = "", String date = ""]) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}attendance/attendanceScore?classId=$classId&date=$date');
 print("request=> headers=${jsonEncode(headers)}, url=> ${url.toString()}");
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("getScore=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result = isSuccess? atdScoreModelFromJson(response.body): null;
 return ApiResponse(isSuccess, message , result);

}

//good
Future<ApiResponse> getAtdScoreByUserId(String userId,[ String classId = "", String date= ""]) async {
 String deviceId = await PlatformDeviceId.getDeviceId ?? "";
 var headers = {"Authorization" :"Bearer ${getAccessToken()}", "Content-Type": "application/json","device-ID":deviceId};
 final url = Uri.parse('${baseUrl}attendance/attendanceScore');
 final response =  await http.get(url, headers: headers);
 var isSuccess = response.statusCode == 200;
 print("getScoreUserId=>>>> ${response.body}");
 var message = isSuccess ? "" :  errorModelFromJson(response.body).message;
 var result = isSuccess? atdScoreModelFromJson(response.body): null;
 return ApiResponse(isSuccess, message , result);

}









