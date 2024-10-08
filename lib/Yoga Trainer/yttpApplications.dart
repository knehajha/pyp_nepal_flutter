

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';


import 'package:google_fonts/google_fonts.dart';

import '../util/myColour.dart';





class YttpApplications extends StatefulWidget {
   YttpApplications({Key? key}) : super(key: key);



   @override
   State<YttpApplications> createState() => _YttpApplicationsState ();
}

class _YttpApplicationsState extends  State<YttpApplications>{




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Yttp Applications",
          style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        // leading: Padding(
        //   padding: const EdgeInsets.only(left: 8.0),
        //   child: IconButton(
        //     icon:  const Icon(Icons.arrow_back_ios, color: Colors.white),
        //     onPressed: () => Navigator.of(context).pop(),
        //   ),
        // ),
      ),

      body:
      Column(
        children: [
       //   const SizedBox(height: 25,),
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
       //   const SizedBox(height: 20,),
          Expanded(

              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: ( BuildContext context,  int index) =>
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
                              padding: EdgeInsets.fromLTRB(8,10,0,9),
                              child: Image(image: AssetImage("assets/images/ramdev.png"),height: 80,width: 80,),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Yoga Training Program", style: GoogleFonts.poppins(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
                                  overflow: TextOverflow.ellipsis,),
                                  Text("Patanajli Yog Samiti, Nepal", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 12, fontWeight: FontWeight.w400),),
                                 const SizedBox(height: 2,),
                                  Row(
                                    children: [

                                      SvgPicture.asset("assets/images/ic_mobile.svg",width:12,height: 12,
                                        color: Colors.orange,),
                                      const SizedBox(width: 8,),
                                      Text("+91-9876567676", style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 14, fontWeight: FontWeight.w600),),
                                    ],
                                  )
                                ],
                              ),
                            ),

                            //const Spacer(),
                            ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
                                primary: Colors.green,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {},

                              child: Text(
                                "ACCEPT",
                                style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 9, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(width: 5,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0),
                                primary: Colors.red,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {},
                              child: Text(
                                "REJECT",
                                style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 9, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(width: 3,),

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
