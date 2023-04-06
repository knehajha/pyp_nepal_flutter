

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

/*showToast(String message){
  Get.snackbar(
      "Error",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      icon: const Icon(Icons.error_outline, color: Colors.white,));
}*/

showToast(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0,
  );
}