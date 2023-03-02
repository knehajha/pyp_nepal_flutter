import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDonation extends StatefulWidget {
  const MyDonation({Key? key}) : super(key: key);

  @override
  State<MyDonation> createState() => _MyDonationState();
}

class _MyDonationState extends State<MyDonation> {
  int selectedIndex = -1;
  List<String> amt = ["₹ 1000/-","₹ 1500/-", "₹ 2000/-",];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("My Donation"),
      ),

    body: Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text("Donation", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text("How much you want to donate?", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400),),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: amt.length,
                itemBuilder: (BuildContext context, int index) {
              return  Padding(
                padding: const EdgeInsets.only(top:20,left: 20,right: 20),
                child: Container(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton(
                    child: Text(amt[index],style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w500),),
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(width:1.0, color: selectedIndex==index ? Colors.orange: Colors.transparent ),
                        // primary: Colors.black,
                        backgroundColor: selectedIndex==index ? Colors.white: const Color(0xffF6F2F2),

                        shape:const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)))),
                    onPressed: (){
                      setState(() {
                        selectedIndex=index;
                      });
                    }
                  ),
                ),
              );
                }),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("------------------------------------", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xffBFBFBF)),),
    Text("or", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xff242527)),),
    Text("--------------------------------", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, color: const Color(0xffBFBFBF)),),
            ],
          ),
        ),
    const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: TextField(

            style: GoogleFonts.montserrat(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              hintText: 'Enter Amount Manually',
              prefixIcon: const Icon(Icons.phone_android),
            ),
          ),
        ),
          const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(bottom:40,left: 20,right: 20),
          child: Container(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                primary: const Color(0XFF0E132F),
                shape: const StadiumBorder(),
              ),
              child: Text(
                "Continue",
                style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 18, fontWeight: FontWeight.w600),
              ),
              onPressed: () => {}
            ),

          ),
        ),
      ]
    ),
    );
  }
}
