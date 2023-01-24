import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/auth/otp.dart';

import '../util/widgetUtil.dart';

class forgotpass extends StatefulWidget {
  const forgotpass({Key? key}) : super(key: key);

  @override
  State<forgotpass> createState() => _forgotpassState();
}

class _forgotpassState extends State<forgotpass> {
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
                  SizedBox(height: 20),
                  Text(
                   "Don't worry! It happens, Please enter the address associated with your account.",
                    style: GoogleFonts.montserrat(
                      textStyle: Theme.of(context).textTheme.headline4,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: 'Email/Phone Number',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),

                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 59,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                        primary: Colors.black,
                        shape: StadiumBorder(),
                      ),
                      child: Text(
                        "SUBMIT",
                        style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      onPressed: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => const otp())),
                    ),

                  ),


                ]
            ),
          ),
        ),
    );
  }
}


