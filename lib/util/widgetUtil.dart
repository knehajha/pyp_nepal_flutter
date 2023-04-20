

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../network/Api_client.dart';

BoxDecoration bgContainer() {
  return const BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/login_bg.png"), fit: BoxFit.cover),
  );
}

Image appLogo() {
  return const Image(
    image: AssetImage('assets/images/logo.png'),
    height: 150,
    width: 150,
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
    borderRadius: BorderRadius.circular(20.0),
    image: DecorationImage(
      image: AssetImage(url),
      fit: BoxFit.cover,
    ),
  );
}



 void email(email)async {
  final toEmail = email;
  final subject = 'Patanjali Yogpeeth Nepal';
  final body= "Here is the share content body......";
  final url = Uri.parse('mailto:$toEmail?subject=${subject}&body=${body}');
  if (await canLaunchUrl(url)){

    await launchUrl(url);
  }
 }


Widget getProfilePictureView(String imageName){
  return imageName.isNotEmpty ? Image.network(
    '${imageUrl}'+imageName,
    width: 100.0,
    height: 100,
    fit: BoxFit.cover,
  ) : const Image(image: AssetImage("assets/images/ramdev.png"),height: 100,width: 100,);
}

Widget getProfilePictureViewTrainer(String imageName){
  return imageName.isNotEmpty ? Image.network(
    '${imageUrl}'+imageName,
    width: 70.0,
    height: 70,
    fit: BoxFit.cover,
  ) : const Image(image: AssetImage("assets/images/ramdev.png"),height: 70,width: 70,);
}



