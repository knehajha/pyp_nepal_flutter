


import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/network/model/punchInModel.dart';

import '../network/Api_client.dart';
import '../network/model/classDetailModel.dart';
import '../util/myColour.dart';
import '../util/uiUtil.dart';

class PunchInDetails extends StatefulWidget {
  const PunchInDetails({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PunchInDtails();

}


class _PunchInDtails extends  State<StatefulWidget>{
  String punchType = "IN";
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(
            title:  Text("Attendance Goal",
              style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
            ),

        ),
        body:  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,18,20,0 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:  [
                          const Image(image: AssetImage("assets/images/ramdev.png"),height: 90, width: 90,),

                          Text("Ram ji", style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 13, fontWeight: FontWeight.w600),),
                        ],
                      ),

                      Expanded(

                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              const SizedBox(height: 10,),
                              Text("Yoga Class", style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 20, fontWeight: FontWeight.w700),),
                              const SizedBox(height: 8,),
                              Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.publicSans(color:ColorConstants.textSecondryColor, fontSize: 15, fontWeight: FontWeight.w400),),
                              const SizedBox(height: 8,),

                              Row(
                                children: [
                                  const Image(image: AssetImage("assets/images/clock.png"),height: 12, width: 12,),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Text("10AM - 11AM", style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 13, fontWeight: FontWeight.w600),),
                                  ),

                                ],
                              ),

                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text("Client Rating", style: GoogleFonts.publicSans(color:ColorConstants.textSecondryColor, fontSize: 14, fontWeight: FontWeight.w400),),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                    child: RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemSize: 20,
                                      itemCount: 5,
                                      itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),


                                  ),

                                ],
                              ),
                              const SizedBox( height: 15,),
                              Row(
                                children: [
                                  Text("Venue:", style: GoogleFonts.publicSans(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text("Nepal", style: GoogleFonts.publicSans(color:ColorConstants.textSecondryColor, fontSize: 14, fontWeight: FontWeight.w400),),
                                  ),
                                ],
                              ),
                              const SizedBox( height: 15,),





                              Row(

                                children: [
                                  Row(
                                    children: [
                                      Text("Distance:", style: GoogleFonts.publicSans(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                                      const SizedBox(width: 5,),
                                      Text("5km", style: GoogleFonts.publicSans(color:ColorConstants.textSecondryColor, fontSize: 14, fontWeight: FontWeight.w400),),
                                    ],
                                  ),

                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text("Joined:", style: GoogleFonts.publicSans(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                                      const SizedBox(width: 5,),
                                      Text("02/02/2023", style: GoogleFonts.publicSans(color:ColorConstants.textSecondryColor, fontSize: 14, fontWeight: FontWeight.w400),),
                                      const SizedBox(width: 15,),
                                    ],
                                  )
                                ],
                              ),

                              const SizedBox(height: 15,),
                              const Divider(
                                thickness: 2,
                                color: Colors.orange,
                              ),
                              const SizedBox(height: 15,),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Image.asset("assets/images/attendance_meter.png",width: 30,height: 25,),
                                  const SizedBox(width: 6,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Attendance",style: GoogleFonts.publicSans(color:ColorConstants.textColor, fontSize: 9, fontWeight: FontWeight.w300),),
                                      Text("25%",style: GoogleFonts.publicSans(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                                    ],
                                  ),
                                  const Spacer(),

                                  SvgPicture.asset("assets/images/ic_telephone.svg",height: 20, width: 20,
                                    color: Colors.orange,),
                                  const SizedBox(width: 30,),
                                  SvgPicture.asset(
                                    "assets/images/ic_whatsapp.svg",
                                    height: 20,
                                    width: 20 ,
                                    color: Colors.green,),
                                  const SizedBox(width: 15,),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: SizedBox(
                                  width: 140,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      splashFactory: NoSplash.splashFactory,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal:15.0, vertical: 15.0),

                                      primary: punchType == "IN" ? const Color(0xff6EB52B) : const Color(0xffF2623D),
                                      shape: const StadiumBorder(
                                      ),
                                    ),
                                    onPressed: ()  {},
                                    child: punchType == "IN" ?  Text("PUNCH IN",
                                          style: GoogleFonts.publicSans(color: Colors.black, fontWeight: FontWeight.w800),) :  Text("PUNCH OUT",style: GoogleFonts.publicSans(color: Colors.black, fontWeight: FontWeight.w800
                                  )),
                                ),
                                  ),
                              // const SizedBox(height: 15,)

  )],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),


                Align(
                  alignment:AlignmentDirectional.topStart,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20,20,0,0),
                    child: Text("Attendance",style: GoogleFonts.publicSans(color:Colors.grey, fontSize:16, fontWeight: FontWeight.w700),),
                  ),

                ),

                const SizedBox(height: 20,),
                Container(
                  height: 50,
                  color: ColorConstants.backgroundGray,

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Row(

                      children: [

                        Expanded(

                            child: Text("Date", style: GoogleFonts.publicSans(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,)),
                        Expanded(
                            child: Text("Punch In", style: GoogleFonts.publicSans(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,)),
                        Expanded(
                            child: Text("Punch Out", style: GoogleFonts.publicSans(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,)),
                        Expanded(
                            child: Text("Punch Type", style: GoogleFonts.publicSans(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,)),

                      ],),
                  ),
                ),


                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index,) {
                      return Container(
                        color: (index % 2 == 0) ?const Color(0xffFFFFFF) : const Color(0xffF5F5F5),
                        height: 50,
                        //   color: ColorConstants.backgroundGray,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: Text("12/01/2023", style: GoogleFonts.publicSans(color:const Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,)),
                              Expanded(child: Text("08:30 A.M.", style: GoogleFonts.publicSans(color:const Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,)),
                              Expanded(child: Text("6.06 P.M.", style: GoogleFonts.publicSans(color:const Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,)),
                              Expanded(child: Text("Self", style: GoogleFonts.publicSans(color:const Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,)),

                            ],),


                        ),
                      );
                    },
                  ),
                )
              ],
            ),

    );
  }
}
