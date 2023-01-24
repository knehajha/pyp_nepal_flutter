import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmedSuccess extends StatefulWidget {
  const ConfirmedSuccess({Key? key}) : super(key: key);

  @override
  State<ConfirmedSuccess> createState() => _ConfirmedSuccessState();
}

class _ConfirmedSuccessState extends State<ConfirmedSuccess> {
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
      body: AlertDialog(
        title: Center(child: Text('Confirmed',style:GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.w700,),)),
        content: Wrap(
          children: [
            Center(child: Image.asset('assets/images/confirmSuccess.png',height: 200,width: 200,)),
            const SizedBox(height: 40,),
            Center(child: Text('Thank You!',style:GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700,),)),
            const SizedBox(height: 40,),
            Center(child: Text('Your Confirmed Class Details',style:GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600,),)),
            const SizedBox(height: 40,),
            Center(child: Text('You will be receiving a Confirmation email with details',style:GoogleFonts.montserrat(fontSize: 10, fontWeight: FontWeight.w500,),)),
            const SizedBox(height: 40,),

                Center(
                  child: ElevatedButton(

                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 15.0),
                      primary: const Color(0xffFA9A0B),
                      shape: const StadiumBorder(),
                    ),

                    child: Text(
                      "DONE",
                      style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => const ConfirmedSuccess())),
                  ),
                ),

          ],
        ),
        elevation: 24,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
      ),
    );

  }
}
