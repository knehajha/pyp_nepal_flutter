
import 'dart:collection';
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/Yoga%20Trainer/trainerHome.dart';
import 'package:pyp_nepal/auth/signIn.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/network/Api_client.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../util/widgetUtil.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  String dropDownValue = "";
  Map<String, dynamic> _reqBody = HashMap();

  final List<String> _orgList = [
    "Organisation associated with",
    'Patanjali Yog Committee, Nepal',
    'Mahila Patanjali Yog Committee, Nepal',
    "Yuva Nepal Samiti"
    'None'
  ];

  String? gender;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top:10),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/footer_img.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:0, right: 40,left: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff557c94b6),
                    image: const DecorationImage(
                      image:AssetImage("assets/images/photo_camera.png"),
                      fit: BoxFit.none,

                    ),
                    border:
                    Border.all(color: Colors.grey, width: 2.0),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(80.0)),
                  ),
                ),
              ),

              const SizedBox(height:20),


              Text(
                'Sign Up',
                style: GoogleFonts.montserrat(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,),
              ),
              const SizedBox(height:5),
              Text(
                'Create account to continue!',
                style: GoogleFonts.montserrat(
                  //  textStyle: Theme.of(context).textTheme.headline4,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,),
              ),
              const SizedBox(height:10),

              TextField(
                onChanged: (value){
                  _reqBody["name"] = value;
                },
                decoration: textFieldDecoration("Name", Icons.person), style: GoogleFonts.montserrat(),),
              const SizedBox(height:10),
              TextField(
                onChanged: (value){
                  _reqBody["fatherOrHusbandName"] = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Father/Husband name',
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height:10),
              TextField(
                onChanged: (value){
                  _reqBody["mobileNumber"] = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Mobile No.',
                  prefixIcon: const Icon(Icons.phone_android),
                ),
              ),
              const SizedBox(height:10),
              TextField(
                onChanged: (value){
                  _reqBody["dateOfBirth"] = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Date of birth',
                  prefixIcon: const Icon(Icons.calendar_month_outlined),
                ),
              ),
              const SizedBox(height:10),
              TextField(
                onChanged: (value){
                  _reqBody["email"] = value;
                },

                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Email Id',
                  prefixIcon: const Icon(Icons.mail),
                ),
              ),
              const SizedBox(height:10),





              // Container(
              //    decoration: bgContainer(),
              //   child: Row(
              //     children: [
              //       RadioListTile(
              //         title: const Text("Male"),
              //         value: "male",
              //         groupValue: gender,
              //         onChanged: (value){
              //           setState(() {
              //             gender = value.toString();
              //           });
              //         },
              //       ),
              //       RadioListTile(
              //         title: const Text("Female"),
              //         value: "female",
              //         groupValue: gender,
              //         onChanged: (value){
              //           setState(() {
              //             gender = value.toString();
              //           });
              //         },
              //       ),
              //       RadioListTile(
              //         title: const Text("Other"),
              //         value: "other",
              //         groupValue: gender,
              //         onChanged: (value){
              //           setState(() {
              //             gender = value.toString();
              //           });
              //         },
              //       )
              //     ],
              //   ),
              // ),
             // const SizedBox(height:10),
              // ToggleSwitch(
              //   minWidth: 190.0,
              //   minHeight: 60,
              //   initialLabelIndex: 1,
              //   cornerRadius: 30.0,
              //   activeFgColor: Colors.white,
              //   inactiveBgColor: Colors.grey,
              //   inactiveFgColor: Colors.white,
              //   totalSwitches: 2,
              //   labels: const ['Married', 'Single'],
              //   icons: const [FontAwesomeIcons.venusMars, FontAwesomeIcons.genderless],
              //   activeBgColors: const [[Colors.deepOrange],[Colors.deepOrange]],
              //   onToggle: (index) {
              //     print('switched to: $index');
              //   },
              // ),
              const SizedBox(height:10),


              TextField(
                onChanged: (value){
                  _reqBody["password"] = value;
                },
                style: GoogleFonts.montserrat(),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height:10),

              TextField(
              style: GoogleFonts.montserrat(),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                hintText: 'Confirm Password',
      prefixIcon: const Icon(Icons.lock),
    ),
    ),
              const SizedBox(height:10),
              DropdownButtonFormField(
                isExpanded: true,
                itemHeight: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0)
                  ),
                  hintText: 'Organisation associated with',
                  prefixIcon: const Icon(Icons.group),
                ),
                dropdownColor: Colors.white,
                value: dropDownValue.isEmpty ? _orgList[0] : dropDownValue,
                onChanged: (newValue) {
                  _reqBody["organization"] = newValue;
                  setState(() {
                    dropDownValue = newValue.toString();

                  });
                },
                items: _orgList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.montserrat(fontSize: 14, ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height:10),
              TextField(
                onChanged: (value){
                  _reqBody["address"] = value;
                },
                style: GoogleFonts.montserrat(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  hintText: 'Add Address',
                  suffixIcon: IconButton(
                    icon: SvgPicture.asset("assets/images/addIcon.svg",color: Colors.black45,height: 22,width: 22,),
                    onPressed: () {  },
                  ),
                  prefixIcon: IconButton(
                    icon: SvgPicture.asset("assets/images/address_home.svg",height: 22,width: 22,),
                    onPressed: () {  },
                ),
              ),),
              const SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(bottom:40),
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
                      "Submit",
                      style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    onPressed: () async {
                      var response = await signup(_reqBody);
                      if(response.isSuccess){
                        Get.to(const SignIn());
                      }else{
                        Get.snackbar(
                            "Error",
                            response.message,
                            colorText: Colors.white,
                            backgroundColor: Colors.black,
                            icon: const Icon(Icons.error_outline, color: Colors.white,));
                      }
                    },


                    ))),


            ]
      ),
    ),
      ),
    );
  }
}
