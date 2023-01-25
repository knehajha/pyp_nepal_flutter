import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';

import '../auth/login.dart';

class Splash extends StatelessWidget {
  const Splash ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner : false,
    home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    Timer( const Duration(seconds: 3), () =>
        Get.off(const Login())
    );

    return Scaffold(
        body: Container(
          decoration: bgContainer(),
        child:Center(
          child: appLogo(),
        )
        )
    );
  }
}


