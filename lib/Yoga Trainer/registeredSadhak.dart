

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../util/myColour.dart';

class RegisteredSadhak extends StatelessWidget {
  final String _title;
 // const RegisteredSadhak({Key? key}) : super(key: key);
  const RegisteredSadhak(this._title, {super.key});


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text(_title,
          style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        titleSpacing: 00.02,
      //  centerTitle: true,
       // toolbarHeight: 60.2,
      /*  toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(15),
              bottomLeft: Radius.circular(15)),
        ),*/
        elevation: 0.00,

        actions: [

          SvgPicture.asset("assets/images/noty.svg",height: 25,
            width: 25,
          ),
          const SizedBox(width: 20,)
        ],
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

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(8.0,8,8,8),
              itemCount: 15,
              itemBuilder: (context, index) =>
                  Card(
                    elevation: 4,
                    child: Row(

                      children:  [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8,10,0,8),
                          child: Image(image: AssetImage("assets/images/ramdev.png"),height: 90,width: 90,),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8,),
                              Text("Yoga Class", style: GoogleFonts.poppins(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                              const SizedBox(height: 8,),
                              Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 12, fontWeight: FontWeight.w400),),
                              const SizedBox(height: 5,),
                              Text("Sadhak", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 14, fontWeight: FontWeight.w600),),
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
                                     "assets/images/ic_msg.svg", height: 16,width: 16,
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
                                       "assets/images/ic_whatsapp.svg", height: 16,width: 16,
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
                                       "assets/images/ic_telephone.svg", height: 16,width: 16,
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
