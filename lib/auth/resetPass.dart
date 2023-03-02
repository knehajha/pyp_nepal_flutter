import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/auth/forgotpass.dart';
import 'package:pyp_nepal/auth/signIn.dart';

import '../util/widgetUtil.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);


  @override
  State<ResetPass> createState() => _signInState();
}

class _signInState extends State<ResetPass> {
  bool status = false;
  bool isChecked = false;

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
    "Reset Password",
    style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
    textAlign: TextAlign.left,
    ),

      const SizedBox(height: 12,),
      TextField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: 'New Password',

          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0)
          ),
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock),
        ),
      ),
      const SizedBox(height: 12,),
      TextField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: 'Confirm Password',

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock),
        ),
      ),
      const SizedBox(height: 10),

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
            "Reset".toUpperCase(),
            style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w400),
          ),
          onPressed: () {
            Get.offAll(const SignIn());
          }

        ),

      ),

    ]
      ),
    ),
      ),
    );
  }
}

