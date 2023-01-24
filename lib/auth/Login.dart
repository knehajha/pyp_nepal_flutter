import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/auth/signIn.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';

import 'signup.dart';

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
          padding: const EdgeInsets.all(40.0),
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
              child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   padding: EdgeInsets.symmetric(
                       horizontal: 40.0, vertical: 20.0),
                   primary: Colors.black,
                   shape: StadiumBorder(),
                 ),

                 child: Text(
                   "Login",
                   style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w500),
                 ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const signIn())),
               ),

          ),
              SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 60,
            child: OutlinedButton(
              child: Text('Sign Up',style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w500),),
              style: OutlinedButton.styleFrom(
                  side: BorderSide(width:1.0, color: Colors.black),
                 // primary: Colors.black,
                  backgroundColor: Colors.white,

                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)))),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Signup())),
            ),
          ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login as a', style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),),
                  const Icon(Icons.arrow_forward_ios, size: 13,),
                  const Text("Guest",style: TextStyle(color: Colors.deepOrange),),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
