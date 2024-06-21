import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pyp_nepal/Yoga%20Trainer/registeredSadhak.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/util/app_preference.dart';
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
import '../network/model/login_model.dart';

class Splash extends StatelessWidget {
  const Splash ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.circularReveal,
      transitionDuration: const Duration(milliseconds: 500),
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



  _gotToScreen(){
    User? profile = getProfile();
    if(profile == null){
      Get.off(const Login());
    }else if(profile.userType == "1"){
      Get.off(const Dashboard());
    }else if(profile.userType == "2"){
      Get.off(const TrainerHome());
    }else{
      Get.off(const Login());
    }
  }






  @override
  void initState() {
    super.initState();
    Timer( const Duration(seconds: 2), () =>
        _gotToScreen()


    );
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Container(
          decoration: bgContainer(),
        child:Center(
          child: appLogo(),
        )
        ),

    );
  }
}


