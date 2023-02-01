


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/myColour.dart';

class PunchInDetails extends StatelessWidget {
  const PunchInDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
        Container(
        color: Colors.red,
        height: 170,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25,40,25,30),
          child: Row(
            children:  [
              SvgPicture.asset("assets/images/ic_back_arrow.svg",height: 25,
                width: 25,
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: Text("Attendance Goal", style: GoogleFonts.poppins(color:Colors.white, fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.3),),
              ),
              const Spacer(),
              SvgPicture.asset("assets/images/noty.svg",height: 25,
                width: 25,
              ),
            ],
          ),
        ),

      ),

          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20,20,15,0 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const Image(image: AssetImage("assets/images/ramdev.png"),height: 80, width: 80,),

                    Text("Ram ji", style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 13, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0,18,20,20 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text("Yoga Class", style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 18, fontWeight: FontWeight.w700),),
                   const SizedBox(height: 6,),
                    Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 14, fontWeight: FontWeight.w400),),
                    const SizedBox(height: 6,),

                    Row(
                      children: [
                        const Image(image: AssetImage("assets/images/clock.png"),height: 10, width: 10,),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("10AM - 11AM", style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 12, fontWeight: FontWeight.w700),),
                        ),

                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                         Text("Client Rating", style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 12, fontWeight: FontWeight.w700),),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text("10AM - 11AM", style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 12, fontWeight: FontWeight.w700),),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
    ]
    ),
    );
  }
}
