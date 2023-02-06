import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/Yoga%20Trainer/registeredSadhak.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import '../Yoga Trainer/DonationDetails.dart';
import '../Yoga Trainer/punchInDetails.dart';
import '../Yoga Trainer/sadhakAttendingClass.dart';
import '../Yoga Trainer/teacherTrainingConduct.dart';
import '../Yoga Trainer/trainerHome.dart';
import '../Yoga Trainer/yttpApplications.dart';
import '../auth/login.dart';
import '../myclasses/myClassesPunchIn.dart';

class Splash extends StatelessWidget {
  const Splash ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.orange,
          appBarTheme: AppBarTheme(titleTextStyle: GoogleFonts.montserrat(color: Colors.white, fontSize: 16, ), iconTheme: const IconThemeData(color: Colors.white,))),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
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
      //  Get.off(const HomePage())
      //  Get.off(const MyClassesPunchIn())
      //  Get.off(const YttpApplications())
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


