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
        Expanded(child: Text("-----------------------------------or------------------------------------", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffBFBFBF)),)),
      ]
    ),
    );
  }
}
