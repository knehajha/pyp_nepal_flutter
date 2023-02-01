

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../util/myColour.dart';

class RegisteredSadhak extends StatelessWidget {
  const RegisteredSadhak({Key? key}) : super(key: key);

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
                      child: Text("Registered Sadhak", style: GoogleFonts.poppins(color:Colors.white, fontSize: 20, fontWeight: FontWeight.w700,letterSpacing: 0.3),),
                    ),
                    const Spacer(),
                    SvgPicture.asset("assets/images/noty.svg",height: 25,
                      width: 25,
                    ),
                  ],
                ),
              ),

          ),

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
                              Text("Yoga Class", style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w600),),
                              Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 10, fontWeight: FontWeight.w400),),
                              Text("Sadhak", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 12, fontWeight: FontWeight.w600),),
                            ],
                          ),
                        ),

                       Expanded(
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             SizedBox(
                                 height: 35,
                                 width: 35,
                                 child: TextButton(

                                   style: TextButton.styleFrom(
                                       shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.circular(50),
                                         side: const BorderSide(color:  ColorConstants.kSecondaryColor,width: 3.0),
                                       ),
                                       backgroundColor:Colors.white,
                                       elevation: 6
                                   ),

                                   onPressed: () {},
                                   child:   Center( child: SvgPicture.asset(
                                     "assets/images/ic_msg.svg", height: 15,width: 15,
                                   ),
                                   ),
                                 )),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(8,0,8,0),
                               child: SizedBox(
                                   height: 35,
                                   width: 35,
                                   child: TextButton(

                                     style: TextButton.styleFrom(
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(50),
                                           side: const BorderSide(color:  ColorConstants.kSecondaryColor,width: 3.0),
                                         ),
                                         backgroundColor:Colors.white,
                                         elevation: 6
                                     ),

                                     onPressed: () {},
                                     //     child:  const Center(child: Icon(Icons.camera_alt_outlined),),
                                     child:   Center( child: SvgPicture.asset(
                                       "assets/images/ic_whatsapp.svg", height: 15,width: 15,
                                     ),
                                     ),
                                   )),
                             ),
                             Padding(
                               padding: const EdgeInsets.fromLTRB(0,0,10,0),
                               child: SizedBox(
                                   height: 35,
                                   width: 35,
                                   child: TextButton(

                                     style: TextButton.styleFrom(
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(50),
                                           side: const BorderSide(color:  ColorConstants.kSecondaryColor,width: 3.0),
                                         ),
                                         backgroundColor:Colors.white,
                                         elevation: 6
                                     ),
                                     onPressed: () {},
                                     //     child:  const Center(child: Icon(Icons.camera_alt_outlined),),
                                     child:   Center( child: SvgPicture.asset(
                                       "assets/images/ic_telephone.svg", height: 15,width: 15,
                                     ),
                                     ),
                                   )),
                             ),
                           ],
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
