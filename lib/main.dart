// @dart=2.9
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/util/app_preference.dart';

import 'splash/Splash.dart';

Future<void> main() async {
  await GetStorage.init(keyStorage);
  runApp((const Splash()));
}



