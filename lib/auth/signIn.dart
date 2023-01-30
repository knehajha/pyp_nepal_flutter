import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/auth/forgotpass.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';

import '../util/widgetUtil.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);


  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
    "Sign In",
    style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
    textAlign: TextAlign.left,
    ),
    Text(
    "Create account to continue!",
    style: GoogleFonts.montserrat(),
    textAlign: TextAlign.left,
    ),
      const SizedBox(height: 12,),
      TextField(

        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email/Phone number',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          hintText: 'Email/Phone number',
          prefixIcon: const Icon(Icons.person),
        ),
      ),
      const SizedBox(height: 12,),
      TextField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: 'Password',

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock),
        ),
      ),
      const SizedBox(height: 10),
      Align(
        alignment: Alignment.centerRight,
        child: InkWell( onTap: (){
          Get.to(const ForgotPass());
        }, child: Padding(
          padding: const EdgeInsets.only(top: 5.0,right: 10),
          child: Text("Forgot password?",style:GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600,color:const Color(0xff3B0000) ),),
        )),
      ),
      const SizedBox(height: 50),
      Row(
        children: [
          Checkbox(value: isChecked, onChanged: (isOn){
            setState(() {
              isChecked = isOn!;
            });
          }),
        Text(
        'Remind me next time',
        style: GoogleFonts.montserrat(
          fontSize: 14,
          fontWeight: FontWeight.w600,),
        ),
            ],
      ),
    SizedBox(height: 20),
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
            "SIGN IN",
            style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w400),
          ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Dashboard())),
        ),

      ),

    ]
      ),
    ),
      ),
    );
  }
}

