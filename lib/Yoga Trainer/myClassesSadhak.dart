import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/Yoga%20Trainer/newClass.dart';
import 'package:pyp_nepal/Yoga%20Trainer/trainerHome.dart';

import '../network/Api_client.dart';
import '../network/Api_response.dart';
import '../network/model/fetchClass.dart';
import '../util/progress_dialog.dart';
import '../util/uiUtil.dart';

class MyClassSadhak extends StatefulWidget {
  const MyClassSadhak({Key? key}) : super(key: key);

  @override
  State<MyClassSadhak> createState() => _MyClassSadhakState();
}

class _MyClassSadhakState extends State<MyClassSadhak> {

  List<FetchClassModel> myClasses = [];
  ApiResponse? response = null;


  // create always a api method when at landing time data required
  _getMyClasses() async {
    response  = await fetchClass();
    if(response!.isSuccess){
      setState(() {
        myClasses = response!.result;
      });
    }else{
      showToast(response!.message);
    }
  }

  // call that method in initState[auto run it when page first come in front]
  @override
  initState()   {
    super.initState();
    _getMyClasses();
    }

   Widget _getEmptyView(){
        return Center(
          child: response == null ? CircularProgressIndicator() : Text("No result found!"),
        );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  Text("My Classes",
          style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
        body:
        myClasses.isEmpty ? _getEmptyView() :  Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: myClasses.length,
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
                                        Text(myClasses[index].trainerName, style: GoogleFonts.poppins(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w500),)
                                      ],
                                    ),
                                    const SizedBox(width: 20,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10,),
                                          Text(myClasses[index].name, style: GoogleFonts.poppins(color:Colors.black, fontSize: 21, fontWeight: FontWeight.w500),),
                                          const SizedBox(height: 10,),
                                          Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.poppins(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                                          const SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Text("Established :", style: GoogleFonts.poppins(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                                              const SizedBox(width: 10,),

                                              Text("${myClasses[index].establishDate}", style: GoogleFonts.poppins(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                                            ],
                                          ),
                                          const SizedBox(height: 5,),
                                          Row(
                                            children: [
                                              Image.asset('assets/images/clock.png',width: 13,height: 13,),
                                              const SizedBox(width: 10,),
                                              Text(myClasses[index].startTime, style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                                              const SizedBox(width: 1,),
                                              Text("-", style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                                              const SizedBox(width: 1,),
                                              Text(myClasses[index].endTime, style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
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
                                              Flexible(child: Text(myClasses[index].address, style: GoogleFonts.poppins(color:const Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w500),)),
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



