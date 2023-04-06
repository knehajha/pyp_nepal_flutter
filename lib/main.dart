// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/util/app_preference.dart';

import 'splash/Splash.dart';

Future<void> main() async {
  _init3rdParty();
  runApp((const Splash()));
}

_init3rdParty() async {
  await GetStorage.init(keyStorage);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}



