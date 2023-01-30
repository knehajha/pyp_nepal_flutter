

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget  primaryButton(String buttonName) {
  return Container(
    height: 55,
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.5),
        color: const Color(0xff393939),
        boxShadow: const [
          BoxShadow(
            color: Color(0x80000000),
            blurRadius: 2.0,
            offset: Offset(0.0, 2.0),
          ),
        ],
        ),
    child: Center(
      child: Text(
        buttonName.toUpperCase(),
        style: GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ),
  );
}

Widget  secondaryButton(String buttonName) {
  return Container(
    height: 55,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(27.5),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color(0x80000000),
          blurRadius: 2.0,
          offset: Offset(0.0, 2.0),
        ),
      ],
      

    ),
    child: Center(
      child: Text(
        buttonName.toUpperCase(),
        style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400),
      )
    ),
  );
}



