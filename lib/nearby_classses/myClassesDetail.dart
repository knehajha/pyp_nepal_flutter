import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/nearby_classses/confirmDetailAlert.dart';

class MyClassesDetail extends StatefulWidget {
  const MyClassesDetail({Key? key}) : super(key: key);

  @override
  State<MyClassesDetail> createState() => _MyClassesDetailState();
}

class _MyClassesDetailState extends State<MyClassesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:const Color(0xffFFBA01),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,size: 30,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("My Classes"),
          titleTextStyle: GoogleFonts.montserrat(color:const Color(0xffFFFFFF),
          fontSize: 18, fontWeight: FontWeight.w500)),
          // actions: const <Widget>[
          //   Padding(
          //     padding: EdgeInsets.all(16.0),
          //   ),

      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Kashikot 33700, Nepal",style:GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600,),),

                IconButton(
                    icon: const Icon(Icons.my_location_rounded),
                    color: const Color(0xff4C9E00),
                    iconSize: 40,
                    onPressed: () {
                      setState(() {});
                    }),
                  ],
              ),
          Card(
            color: Colors.white,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage("assets/images/ramdev.png"),height: 50,width: 50,),
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
                        Text("10AM -11AM", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
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

                    Row(
                      children: [Text("Venue :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                        SizedBox(width: 10,),
                        Text("Nepal", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    const SizedBox(height: 14,),
                    Row(
                      children: [
                        Text("Distance :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                        const SizedBox(width: 2,),
                        Text("2km", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                        const SizedBox(width: 24,),
                        Text("Joined :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                        const SizedBox(width: 2,),
                        Text("24/01/2023", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                      ],),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Image.asset("assets/images/telephone-2.png",width:18,height: 18,),
                        const SizedBox(width: 10,),
                        Image.asset("assets/images/whatsapp.png",width:20,height: 20,),
                        const SizedBox(width: 10,),
                      ],

                    )

                  ],
                ),
              ],
            ),
          ),
              SizedBox(height: 40,),
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 70.0, vertical: 15.0),
                  primary: const Color(0xff6EB52B),
                  shape: const StadiumBorder(),
                ),

                child: Text(
                  "JOIN",
                  style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w700),
                ),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const ConfirmDetailAlert())),
              ),
            ],
          ),
        ),
        ),


    );

    }
}

