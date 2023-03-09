

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

showToast(String message){
  Get.snackbar(
      "Error",
      message,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      icon: const Icon(Icons.error_outline, color: Colors.white,));
}