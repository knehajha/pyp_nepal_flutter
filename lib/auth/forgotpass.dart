import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/auth/otp.dart';
import 'package:pyp_nepal/auth/resetPass.dart';
import 'package:pyp_nepal/network/Api_client.dart';

import '../util/widgetUtil.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final userIdController = TextEditingController();


  String username ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Container(
          decoration: bgContainer(),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: GoogleFonts.montserrat(
                    //  textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 35,
                      fontWeight: FontWeight.w500,),
                  ),
                  const SizedBox(height: 20),
                  Text(
                   "Don't worry! It happens, Please enter the address associated with your account.",
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: userIdController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Email/Phone Number',
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 59,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        primary: Colors.black,
                        shape: const StadiumBorder(),
                      ),
                      child: Text(
                        "SUBMIT",
                        style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w400),
                      ),
    onPressed: (){},
    // onPressed: () async {
    //   var response = await forgotPass(username);
    //   if (response.isSuccess) {
    //     Get.to(const ResetPass());
    //   } else {
    //     Get.snackbar(
    //         "Error",
    //         response.message,
    //         colorText: Colors.white,
    //         backgroundColor: Colors.black,
    //         icon: const Icon(Icons.error_outline, color: Colors.white,));
    //   }
    ),
                  ),


                ]
            ),
          ),
        ),
    );
  }
}


