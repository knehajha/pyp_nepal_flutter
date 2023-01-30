import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/donation/myDonation.dart';

class Donation extends StatefulWidget {
  const Donation({Key? key}) : super(key: key);

  @override
  State<Donation> createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Donation"),
    actions: <Widget>[
    IconButton(
    icon: const Icon(Icons.calendar_month_sharp),
    onPressed: () {
    setState(() {});
    }),
    ]
    ), 
      body: Column(
        children: [
          Center(child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text("दक्षिणावन्तः अमृतं भजन्ते", style: GoogleFonts.montserrat(color:const Color(0xffE66C00), fontSize: 24, fontWeight: FontWeight.w700),),
          )),
          const SizedBox(height: 10,),
          Text("दान दक्षिणा देने वाले अमर पद को प्राप्त करते हैं ।", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 13, fontWeight: FontWeight.w300),),
          const SizedBox(height: 15,),
          Text("Amount", style: GoogleFonts.montserrat(color:Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w500),),
          const SizedBox(height: 2,),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 45,width: 45,
                  child: Image.asset("assets/images/donation.png",width:20,height: 20,color: Colors.black,)),
              const SizedBox(width: 9,),
              Text("1500/-", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 28, fontWeight: FontWeight.w700),),

            ],
          ),
          const SizedBox(height: 24,),
          Padding(
            padding: const EdgeInsets.only(bottom:15,left: 15,right: 15),
            child: Container(
              color: const Color(0xffF5F5F5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Date", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  Text("Donate To", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  Text("Received ", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                  Text("Amount", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),

                ],),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index,) {
                return Container(
                  color: (index % 2 == 0) ? const Color(0xffFFFFFF) : const Color(0xffF5F5F5),

                  child: ListTile(
                    subtitle:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("27/01/2023", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                        Text("Patanjali Yogpeeth", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                        Text("Neha", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                        Text("₹ 1000/-", style: GoogleFonts.montserrat(color:const Color(0xff464646), fontSize: 14, fontWeight: FontWeight.w500),),
                      ],),

                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: SizedBox(
              width: 220,
              height: 55,
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal:35, vertical: 15.0),
                    primary: const Color(0xff393939),
                    shape: const StadiumBorder(),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ Image.asset("assets/images/donation.png",width:20,height: 20,color: Colors.white,),
                      const SizedBox(width: 9,),
                      Text("DONATE", style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w700),),
                    ],
                  ),
                  onPressed: (){
                    Get.to(const MyDonation());
                  }
              ),
            ),
          ),

        ],
      ) ,
    );
  }
}
