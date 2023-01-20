import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

BoxDecoration bgContainer() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/splashbg.png"), fit: BoxFit.cover),
  );
}

Image appLogo() {
  return const Image(
    image: AssetImage('assets/images/logo.png'),
    height: 135,
    width: 135,
  );
}

InputDecoration textFieldDecoration(String hint, IconData icon){
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    hintText: hint,
    prefixIcon: Icon(icon),
  );
}

TextStyle menuItemStyle(){
  return  GoogleFonts.montserrat(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.black);
}

Decoration getBannerDecoration(String url){
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    image: DecorationImage(
      image: NetworkImage(url),
      fit: BoxFit.cover,
    ),
  );
}







