import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/myclasses/myClassesPunchIn.dart';
import 'package:pyp_nepal/util/map_util.dart';

import '../Yoga Trainer/trainerHome.dart';
import '../network/Api_client.dart';
import '../network/Api_response.dart';
import '../network/model/atdScoreModel.dart';
import '../network/model/fetchClass.dart';
import '../util/uiUtil.dart';

class MyClasses extends StatefulWidget {
  const MyClasses({Key? key}) : super(key: key);

  @override
  State<MyClasses> createState() => _MyClassesState();
}

class _MyClassesState extends State<MyClasses> {



  List<FetchClassModel> myClasses = [];
  ApiResponse? response = null;



  _getMyClasses() async {
    response  = await fetchClass();
    if(response!.isSuccess){
      setState(() {
        myClasses = response!.result;
      });
    } else{
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
    return  Scaffold(
      appBar: AppBar(title: const Text("My Classes"),),
      body:ListView.builder(
          itemCount: myClasses.length,
          itemBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.only(left:10, right: 10,),
              child: InkWell(
                onTap: (){
                  Get.to(MyClassesPunchIn(classDetails:myClasses[index]));
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
                        Text(myClasses[index].trainerName, style: GoogleFonts.montserrat(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10,),
                          Text(myClasses[index].name, style: GoogleFonts.montserrat(color:Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                          const SizedBox(height: 10,),
                          Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                          const SizedBox(height: 10,),
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
                          const SizedBox(height: 14,),
                          Row(
                            children: [
                              Text("Rating", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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
                              Expanded(child: Text(myClasses[index].address,
                                softWrap: true,
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),)),
                              const SizedBox(width: 10,)
                            ],
                          ),
                          const SizedBox(height: 14,),
                          Row(
                            children: [
                              const SizedBox(width: 10,),
                              Text("Joined :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                              const SizedBox(width: 2,),
                              Text("${myClasses[index].establishDate}", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
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
