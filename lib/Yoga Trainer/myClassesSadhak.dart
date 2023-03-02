import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/Yoga%20Trainer/newClass.dart';
import 'package:pyp_nepal/Yoga%20Trainer/trainerHome.dart';

class MyClassSadhak extends StatefulWidget {
  const MyClassSadhak({Key? key}) : super(key: key);

  @override
  State<MyClassSadhak> createState() => _MyClassSadhakState();
}

class _MyClassSadhakState extends State<MyClassSadhak> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  Text("My Classes",
          style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return  Padding(
                      padding: const EdgeInsets.only(left:10, right: 10,),
                      child: InkWell(
                        onTap: (){

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
                                        Text("Neha Jha", style: GoogleFonts.poppins(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w500),)
                                      ],
                                    ),
                                    const SizedBox(width: 20,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10,),
                                          Text("Yoga Class", style: GoogleFonts.poppins(color:Colors.black, fontSize: 21, fontWeight: FontWeight.w500),),
                                          const SizedBox(height: 10,),
                                          Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.poppins(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                                          const SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Established :", style: GoogleFonts.poppins(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                                              const SizedBox(width: 10,),

                                              Text("22/02/2023", style: GoogleFonts.poppins(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                                            ],
                                          ),
                                          const SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Image.asset('assets/images/clock.png',width: 13,height: 13,),
                                              const SizedBox(width: 10,),
                                              Text("10AM -11AM", style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                                            ],
                                          ),
                                          const SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Client Rating", style: GoogleFonts.poppins(color:const Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w500),),
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
                                          const SizedBox(height:10,),
                                          Row(
                                            children: [
                                              SvgPicture.asset("assets/images/location.svg",height:17, width: 17),
                                              const SizedBox(width: 5,),
                                              Text("36, Jagatsundar Marg, Kathmandu 44600", style: GoogleFonts.poppins(color:const Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w500),),
                                            ],
                                          ),
                                          const SizedBox(height: 20,),

                                        ],
                                      ),
                                    ),
                                  ],
                                ),

                              ),

                            ]),
                      ),);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0XFF0E132F),
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      "+ADD NEW CLASS",
                      style: GoogleFonts.montserrat(color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () =>
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                          builder: (context) => const NewClass(),


                        ))),
              ),
            ),
          ],
        ),



    );

  }
}



