 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/auth/signIn.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';

import 'signup.dart';

 class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
  }

 class _LoginState extends State<Login> {

 bool changedColor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgContainer(),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(110.0),
                child: Center(
                  child: appLogo(),
                ),
              ),
              Text(
                "Getting Started",
                style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Text(
                "Create account to continue",
                style: GoogleFonts.montserrat(),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                height: 59,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 20.0),
                    primary: Colors.black,
                    shape: const StadiumBorder(),
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  onPressed: () async {
                    Get.to(const SignIn());
                  },
                ),
              ),

           const SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 55,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(width:1.0, color: Colors.black),
                 // primary: Colors.black,
                  backgroundColor: Colors.white,

                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
              onPressed: () =>  Get.to(const Signup()),
              child: Text('Sign Up',style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w500),),
            ),
          ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login as a', style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),),
                  const Icon(Icons.arrow_forward_ios, size: 13,),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: (){
                      Get.to(const Dashboard());
                    },
                      child: const Text("Guest",style: TextStyle(color: Colors.deepOrange),  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
