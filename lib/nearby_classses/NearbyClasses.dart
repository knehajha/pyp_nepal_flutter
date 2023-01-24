import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/nearby_classses/NearbyClassMap.dart';
import 'package:pyp_nepal/nearby_classses/myClassesDetail.dart';

class NearbyClasses extends StatefulWidget {
  const NearbyClasses({Key? key}) : super(key: key);

  @override
  State<NearbyClasses> createState() => _NearbyClassesState();
}

class _NearbyClassesState extends State<NearbyClasses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xffFFBA01),
        leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white,size: 30,),
    onPressed: () => Navigator.of(context).pop(),
    ),
    title: const Text("Nearby Classes"),titleTextStyle: GoogleFonts.montserrat(color:const Color(0xffFFFFFF),  fontSize: 18, fontWeight: FontWeight.w500),
        actions: <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset('assets/images/appBarAddres.png',width: 32,height: 32,),
      ),
      ]),
        body:ListView.builder(
            itemCount: 25,
            itemBuilder: (BuildContext context, int index) {
              return  Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Column(
                      children: [
                        const Image(image: AssetImage("assets/images/ramdev.png"),height: 60,width: 60,),
                        Text("Neha Jha", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w500),)
                      ],
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 20,),

                        Text("Yoga Class", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 24, fontWeight: FontWeight.w500),),
                        const SizedBox(height: 10,),
                        Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Image.asset('assets/images/clock.png',width: 13,height: 13,),
                            const SizedBox(width: 10,),
                            Text("10AM -11AM", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Text("Client Rating", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 10, fontWeight: FontWeight.w500),),
                            const SizedBox(width: 3,),
                            RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                              itemSize: 22.0,
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
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            Image.asset("assets/images/telephone-2.png",width:18,height: 18,),
                            const SizedBox(width: 10,),
                            Image.asset("assets/images/whatsapp.png",width:20,height: 20,),
                            const SizedBox(width: 50,),
                            InkWell( onTap: (){
                              Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const MyClassesDetail()));
                            },
                            child:Text("Distance :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),),
                            const SizedBox(width: 2,),
                            InkWell( onTap: (){
                              Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const NearbyClassMap()));
                            },
                            child:Text("2km", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                            )],),

                        SizedBox(height: 20,),
                      ],
                    ),
                  ],
                ),
              );
            }),
    );


  }

  }

