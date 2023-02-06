

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../util/myColour.dart';

class SadhakAttendingList extends StatelessWidget {
  const SadhakAttendingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text("Sadhak Attending Class",
          style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        titleSpacing: 00.02,
        elevation: 0.00,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon:  const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [

          SvgPicture.asset("assets/images/noty.svg",height: 25,
            width: 25,
          ),
          const SizedBox(width: 20,)
        ],
      ),
      body: Column(
        children: [



          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(8.0,8,8,8),
                itemCount: 4,
                itemBuilder: (context, index) =>
                    Card(
                      elevation: 4,
                      child: Row(

                        children:  [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(8,10,0,8),
                            child: Image(image: AssetImage("assets/images/ramdev.png"),height: 70,width: 70,),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Yoga Class", style: GoogleFonts.poppins(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 12, fontWeight: FontWeight.w400),),
                                Text("Sadhak", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 14, fontWeight: FontWeight.w600),),
                              ],
                            ),
                          ),

                          Expanded(
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset("assets/images/attendance_meter.png",width: 30,height: 25,),
                                  const SizedBox(width: 8,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Attendance",style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 11, fontWeight: FontWeight.w300),),
                                      Text("25%",style: GoogleFonts.publicSans(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w800),),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )



                        ],
                      ),
                    )

            ),
          ),
        ],
      ),
    );
  }
}
