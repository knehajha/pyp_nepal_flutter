import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';


class MyClassesPunchIn extends StatefulWidget {
  const MyClassesPunchIn({Key? key}) : super(key: key);

  @override
  State<MyClassesPunchIn> createState() => _MyClassesPunchInState();
}

class _MyClassesPunchInState extends State<MyClassesPunchIn> {
  String punchType = "IN";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("My Classes"),),
      body:Column(
        children: [
         Padding(
           padding: const EdgeInsets.all(12.0),
           child: Card(
             color: Colors.white,
             elevation: 1,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(8),
             ),
             child: Column(
               children: [
                 Row(
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
                           const SizedBox(height: 20,),
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
                             children: [Text("Venue :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
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
                               const SizedBox(width: 14,),
                               Text("Joined :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700,),),
                               const SizedBox(width: 2,),
                               Text("24/01/2023", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500,
                               ),overflow: TextOverflow.ellipsis),
                             ],),

                           const SizedBox(height: 5,),
                           const Divider(
                             thickness: 2,
                             color: Color(0xfff4eada),
                           ),
                           const SizedBox(height: 5,),
                           Padding(
                             padding: const EdgeInsets.only(bottom: 20),
                             child: Row(
                               children: [
                                 Image.asset("assets/images/attendance_meter.png",width:30,height: 30,),
                                 const SizedBox(width: 8,),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                     Text("Attendance", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 10, fontWeight: FontWeight.w400),),
                                     const SizedBox(height: 2,),
                                     Padding(
                                       padding: const EdgeInsets.only(right:30),
                                       child: Text("25%", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                     ),
                                   ],
                                 ),
                                 const SizedBox(width: 90,),
                                 Row(
                                   children: [
                                     Image.asset("assets/images/telephone-2.png",width:24,height: 24,),
                                     const SizedBox(width: 18,),
                                     Image.asset("assets/images/Icon simple-whatsapp.png",width:24,height: 24,),
                                   ],

                                 ),
                               ],
                             ),
                           ),
                           const SizedBox(height: 10,),

                         ],
                       ),
                     ),
                   ],
                 ),
                 Align(
                   alignment: Alignment.centerRight,
                   child: Padding(
                     padding: const EdgeInsets.only(right:18.0),
                     child: SizedBox(
                       width: 160,
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           splashFactory: NoSplash.splashFactory,
                           padding: const EdgeInsets.symmetric(
                               horizontal:35.0, vertical: 15.0),

                           primary: punchType == "IN" ? const Color(0xff6EB52B) : const Color(0xffF2623D),
                           shape: const StadiumBorder(
                           ),
                           ),
                         onPressed: () {
                           setState(() {
                             punchType = punchType == "IN" ? "OUT" : "IN";
                           }); },
                         child: punchType == "IN" ? const Text("PUNCH IN") : const Text("PUNCH OUT"),


                       ),
                     ),
                   ),
                 ),
                 const SizedBox(height: 20,)
               ],
             ),
           ),
         ),

          Align(
              alignment:AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 24),
                child: Text("Attendance",style: GoogleFonts.montserrat(color:Colors.black, fontSize:14, fontWeight: FontWeight.w500),),
              )
          ),
          
          const SizedBox(height: 18,),
          Padding(
            padding: const EdgeInsets.only(bottom:15,left: 15,right: 15),
            child: Container(
              color: const Color(0xffF5F5F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Date", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  Text("Punch In", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  Text("Punch Out", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  Text("Punch Type", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),

                ],),
            ),
          ),

          Flexible(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index,) {
                return Container(
                  color: (index % 2 == 0) ?const Color(0xffFFFFFF) : const Color(0xffF5F5F5),

                child: ListTile(
                  subtitle:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text("12/01/2023", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                  Text("08:30 A.M.", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                    Text("6.06 P.M.", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                    Text("Self", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),

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
