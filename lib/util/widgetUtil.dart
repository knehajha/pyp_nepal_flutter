import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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







