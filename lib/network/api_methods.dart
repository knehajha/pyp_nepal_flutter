import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pyp_nepal/auth/signIn.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'dart:convert';

import 'package:pyp_nepal/network/constants.dart';
import 'package:pyp_nepal/network/model/login_model.dart';
import 'package:pyp_nepal/network/status_error.dart';
import 'package:shared_preferences/shared_preferences.dart';

// http://182.18.142.132:8080/pysn/auth/register
// http://182.18.142.132:8080/pysn/auth/login
// http://182.18.142.132:8080/pysn/auth/forgotPass?userName=8791816225
// http://182.18.142.132:8080/pysn/auth/resetPass?name=8791816225&newPassword=145678&oldPassword=448134

class ApiMethods {
  static Future loginAPI(
      String password, String userNAME, BuildContext context) async {
    Uri url;
    Map<String, String> param = {"password": password, "userName": userNAME};
    var response = await http.post(
      url = Uri(
          scheme: AppBaseUrl.scheme,
          host: AppBaseUrl.host,
          port: AppBaseUrl.port,
          path: AppBaseUrl.login),
      body: json.encode(param),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print("login API STATUS CODE >>>>> ${response.statusCode}");
    print("login API URL >>>>> ${url}");

    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      if (data["user"]["isActive"] == true) {
        // var jsonObj = loginModelFromJson(utf8.decode(response.bodyBytes));
        // SharedPreferences pref = await SharedPreferences.getInstance();
        // pref.setString("token", jsonObj.authToken ?? "");

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
      } else {
        showDialogSingleButton(context, "Message", data["message"], "ok");
      }
    }
  }

  static Future forgotPasswordAPI(BuildContext context, String userNAME) async {
    Uri url;
    Map<String, String> pram = {"userName": userNAME};

    var response = await http.post(
      url = Uri(
          scheme: AppBaseUrl.scheme,
          host: AppBaseUrl.host,
          port: AppBaseUrl.port,
          path: AppBaseUrl.forgotPass,
          queryParameters: pram),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print("forgotPass API STATUS CODE >>>>> ${response.statusCode}");
    print("forgotPass API URL >>>>> ${url}");

    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      // if (data["message"]== "New password has been sent to registered mobile number.") {
      //   // Navigator.push(
      //   //     context, MaterialPageRoute(builder: (context) => SignIn()));
      // } else {
      //   showDialogSingleButton(context, "Message", data["message"], "ok");
      // }
    }
  }

  static Future resetPasswordAPI(BuildContext context, String confirmPass,
      String newPass, String oldPass) async {
    Uri url;
    Map<String, String> pram = {
      "name": confirmPass,
      "newPassword": newPass,
      "oldPassword": oldPass
    };

    var response = await http.post(
      url = Uri(
          scheme: AppBaseUrl.scheme,
          host: AppBaseUrl.host,
          port: AppBaseUrl.port,
          path: AppBaseUrl.resetPass,
          queryParameters: pram),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    print("resetPass API STATUS CODE >>>>> ${response.statusCode}");
    print("resetPass API URL >>>>> ${url}");

    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignIn()));
    } else {
      showDialogSingleButton(context, "Message", data["message"], "ok");
    }
  }
}
