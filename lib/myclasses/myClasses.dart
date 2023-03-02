import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/myclasses/myClassesPunchIn.dart';

import '../Yoga Trainer/trainerHome.dart';

class MyClasses extends StatefulWidget {
  const MyClasses({Key? key}) : super(key: key);

  @override
  State<MyClasses> createState() => _MyClassesState();
}

class _MyClassesState extends State<MyClasses> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("My Classes"),),
      body:ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.only(left:10, right: 10,),
              child: InkWell(
                onTap: (){
                  Get.to( const MyClassesPunchIn());
                },
              child: Column(
              children: [
              Card(
                color: Colors.white,
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        const Image(image: AssetImage("assets/images/ramdev.png"),height: 90,width: 90,),
                        Text("Neha Jha", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text("Yoga Class", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 24, fontWeight: FontWeight.w500),),
                          const SizedBox(height: 10,),
                          Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Image.asset('assets/images/clock.png',width: 13,height: 13,),
                              const SizedBox(width: 10,),
                              Text("10AM -11AM", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                            ],
                          ),
                          const SizedBox(height: 14,),
                          Row(
                            children: [
                              Text("Client Rating", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
                              const SizedBox(width: 4,),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 18.0,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 14,),
                          Row(
                            children: [
                              Text("Venue :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                              const SizedBox(width: 10,),
                              Text("Nepal", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                            ],
                          ),
                          const SizedBox(height: 14,),
                          Row(
                            children: [
                              Text("Distance :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                              const SizedBox(width: 2,),
                              Text("2km", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                              const SizedBox(width: 10,),
                              Text("Joined :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                              const SizedBox(width: 2,),
                              Text("24/01/2023", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                            ],),

                          const SizedBox(height: 10,),
                          const Divider(
                            thickness: 2,
                            color: Color(0xfff4eada),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                Image.asset("assets/images/attendance_meter.png",width:20,height: 20,),
                                const SizedBox(width: 8,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Attendance", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 10, fontWeight: FontWeight.w400),),
                                    const SizedBox(height: 2,),
                                    Padding(
                                      padding: const EdgeInsets.only(right:30),
                                      child: Text("25%", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 12, fontWeight: FontWeight.w600),),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 90,),
                                Row(
                                  children: [
                                    Image.asset("assets/images/telephone-2.png",width:18,height: 18,),
                                    const SizedBox(width: 18,),
                                    Image.asset("assets/images/Icon simple-whatsapp.png",width:20,height: 20,),
                                  ],

                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ]),
                ),);
          }),





    );
  }
}
