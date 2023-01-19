import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/widgetUtil.dart';

class otp extends StatefulWidget {
  const otp({Key? key}) : super(key: key);

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgContainer(),
    child: Padding(
    padding: const EdgeInsets.all(25.0),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Enter OTP",
          style: GoogleFonts.montserrat(fontSize: 35,
            fontWeight: FontWeight.w500,),
          textAlign: TextAlign.center,
        ),
      SizedBox(height: 20),
        Text(
          "A 4-digit OTP code has been sent to ",
          style: GoogleFonts.montserrat(
           // textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 15,
            fontWeight: FontWeight.w400,),
        ),
      SizedBox(height: 20),
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 68,
          width: 64,
      child: TextField(
      onChanged: (value){
        if (value.length==1){
          FocusScope.of(context).nextFocus();
      }
      },
      style: Theme.of(context).textTheme.headline6,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
      FilteringTextInputFormatter.digitsOnly
      ],
        decoration: InputDecoration(counter: Offstage(),filled: true,fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black12),
              borderRadius: BorderRadius.circular(35)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.orange),
              borderRadius: BorderRadius.circular(35)),
        ),
      ),
      ),
        SizedBox(height: 68,width: 64,
          child: TextField(
            onChanged: (value){
              if (value.length==1){
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(counter: Offstage(),filled: true,fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(35)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.orange),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
        ),
        SizedBox(height: 68,width: 64,
          child: TextField(
            onChanged: (value){
              if (value.length==1){
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(counter: Offstage(),filled: true,fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(35)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.orange),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),

        ),
        SizedBox(height: 68,width: 64,
          child: TextField(
            onChanged: (value){
              if (value.length==1){
                FocusScope.of(context).nextFocus();
              }
            },
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
            decoration: InputDecoration(counter: Offstage(),filled: true,fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.black12),
                  borderRadius: BorderRadius.circular(35)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.orange),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
        ),

          ]
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
              "Verify OTP",
              style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 18, fontWeight: FontWeight.w600),
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const otp())),
          ),

        ),


      ]
        ),
    ),
    ),
      ),
    );
  }
}
