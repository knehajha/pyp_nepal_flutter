

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/myColour.dart';

class TeacherTrainingConduct extends StatelessWidget {
  const TeacherTrainingConduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Training Conducted",
          style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            icon:  const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),

      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(12,30,12,20),
            child: TextField(
              textAlign: TextAlign.left,

              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'Search by Name',
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20),
              ),
            ),
          ),
  //        const SizedBox(height: 10,),
          Expanded(

              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) =>
                      Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
                                  Text("Yoga Trining Program", style: GoogleFonts.poppins(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                  Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 12, fontWeight: FontWeight.w400),),
                                 Row(
                                   children: [
                                     Image.asset("assets/images/calendar.png",width:15,height: 15,),
                                     const SizedBox(width: 8,),
                                     Text("12/01/2023 - 12/01/2023", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 14, fontWeight: FontWeight.w600),),


                                   ],
                                 )
                                ],
                              ),
                            ),


                            const Spacer(),

                            SvgPicture.asset("assets/images/ic_group.svg",height:35, width: 35,
                              color: ColorConstants.textColor,),
                            const SizedBox(width: 15,),


                            Column(

                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Sadhak",style: GoogleFonts.poppins(color:ColorConstants.textSecondryColor, fontSize: 12, fontWeight: FontWeight.w700),),
                                Text("25",style: GoogleFonts.poppins(color:ColorConstants.textSecondryColor, fontSize: 15, fontWeight: FontWeight.w800),),

                              ],
                            ),

                            const SizedBox(width: 15,),



                          ],
                        ),
                      )

              )
          ),
        ],
      ),
    );
  }
}
