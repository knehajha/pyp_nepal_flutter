import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/signIn/signIn.dart';
import 'package:pyp_nepal/util/animUtil.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';

import '../signup/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgContainer(),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
              SizedBox(height: 20),

          Container(
            width: double.infinity,
            height: 59,
              child: ElevatedButton(

                 style: ElevatedButton.styleFrom(
                   padding: EdgeInsets.symmetric(
                       horizontal: 40.0, vertical: 20.0),
                   primary: Colors.black,
                   shape: StadiumBorder(),
                 ),

                 child: Text(
                   "Login",
                   style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w400),
                 ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const signIn())),
               ),

          ),
              SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 59,
            child: OutlinedButton(
              child: Text('Sign Up',style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w400),),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width:1.0, color: Colors.black),
                 // primary: Colors.black,
                  backgroundColor: Colors.white,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Signup())),
            ),
          ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login as a', style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),),
                  SizedBox(width: 3),
                Text("Guest",style: TextStyle(color: Colors.deepOrange),
                      ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
