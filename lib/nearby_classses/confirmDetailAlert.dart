import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'confirmedSuccess.dart';
import 'myClassesDetail.dart';

class ConfirmDetailAlert extends StatefulWidget {
  const ConfirmDetailAlert({Key? key}) : super(key: key);

  @override
  State<ConfirmDetailAlert> createState() => _ConfirmDetailAlertState();
}

class _ConfirmDetailAlertState extends State<ConfirmDetailAlert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:const Color(0xffFFBA01),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,size: 30,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Nearby Classes"),
          titleTextStyle: GoogleFonts.montserrat(color:const Color(0xffFFFFFF),
              fontSize: 18, fontWeight: FontWeight.w500)),
      body: AlertDialog(
        title: Center(child: Text('Confirmation Details',style:GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600,),)),
        content: Wrap(
          children: [
            Center(child: Text('Please Join to Confirm the Class',style:GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600,),)),
            const SizedBox(height: 40,),
            Center(child: Image.asset('assets/images/ConfrmAlert.png',height: 200,width: 200,)),
            const SizedBox(height: 40,),
            Center(child: Text('Class Details',style:GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600,),)),
            const SizedBox(height: 40,),
            Row(
              children: [
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal:50.0, vertical: 15.0),
                    primary: const Color(0xffF2623D),
                    shape: const StadiumBorder(),
                  ),

                  child: Text(
                    "NO",
                    style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const MyClassesDetail())),
                ),
                const SizedBox(width: 20,),
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 15.0),
                    primary: const Color(0xff6EB52B),
                    shape: const StadiumBorder(),
                  ),

                  child: Text(
                    "YES",
                    style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const ConfirmedSuccess())),
                ),

              ],
            )
          ],
        ),
        elevation: 24,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
    );
  }
}



