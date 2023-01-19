import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/forgotpass/forgotpass.dart';

import '../util/widgetUtil.dart';

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);


  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  bool status = false;
  bool isSwitchOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgContainer(),
    child: Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    Text(
    "Sign In",
    style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
    textAlign: TextAlign.left,
    ),
    Text(
    "Create account to continue!",
    style: GoogleFonts.montserrat(),
    textAlign: TextAlign.left,
    ),
      SizedBox(height: 12,),
      TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          hintText: 'Email/Phone Number',
          prefixIcon: Icon(Icons.person),
        ),
      ),
      SizedBox(height: 12,),
      TextField(
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          labelText: 'Password',

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock),
        ),
      ),
      SizedBox(height: 10),
      InkWell( onTap: (){
        Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const forgotpass()));
      }, child: Text("Forgot password?",style:GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w400),)),
      SizedBox(height: 50),
      Row(
        children: [
        Text(
        'Remind me next time',
        style: GoogleFonts.montserrat(
          textStyle: Theme.of(context).textTheme.headline4,
          fontSize: 20,
          fontWeight: FontWeight.w600,),
        ),
          SizedBox(width: 50),
          FlutterSwitch(
            width: 70.0,
            height: 25.0,
            toggleSize: 50,
            value: status,
            borderRadius: 60.0,
            padding: 2.0,
            toggleColor: Colors.white,
            switchBorder: Border.all(
              color: Colors.orange,
              width: 2.0,
            ),
            toggleBorder: Border.all(
              color: Colors.white,
              width: 5.0,
            ),
            activeColor: Colors.orange,
            inactiveColor: Colors.white,
            onToggle: (val) {
              setState(() {
                status = val;
              });
            },
          ),
            ],
      ),
    SizedBox(height: 50),
      Container(
        width: double.infinity,
        height: 59,
        child: ElevatedButton(

          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
                horizontal: 40.0, vertical: 20.0),
            primary: Colors.black,
            shape: StadiumBorder(),
          ),

          child: Text(
            "SIGN IN",
            style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w400),
          ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const forgotpass())),
        ),

      ),

    ]
      ),
    ),
      ),
    );
  }
}

