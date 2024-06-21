import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/auth/update_profile.dart';
import 'package:pyp_nepal/network/Api_client.dart';
import 'package:pyp_nepal/network/model/login_model.dart';
import '../util/app_preference.dart';
import '../util/widgetUtil.dart';

class SadhakProfile extends StatefulWidget {
  const SadhakProfile({Key? key}) : super(key: key);

  @override
  State<SadhakProfile> createState() => _SadhakProfileState();
}

class _SadhakProfileState extends State<SadhakProfile> {

  User? user;
  

  
  @override
  void initState() {
   user = getProfile();
   setState(() {

   });
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/footer_img.png'),
                    fit: BoxFit.cover)),
          ),
        ),
      ),

      body: Column(
        children: [
      Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 25,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),

        SizedBox(width: 100,),
      Text(
      'Profile',
          style: GoogleFonts.montserrat(fontSize: 26, fontWeight: FontWeight.w700,)),
      ],
    ),

       SizedBox(height: 10,),
      Center(
        child: Column(
          children: [
            Container(
              height: 120,width: 124,
                child: ClipOval(child: getProfilePictureView(user == null ? "" : user!.image),)),
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: InkWell(
                onTap: (){
                 Get.to(Profile());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     IconButton(

                       icon: SvgPicture.asset("assets/images/edit.svg",height: 19,width: 19,color: Colors.orange,),
                       onPressed: () async {
                         await Get.to(Profile());
                         user = getProfile();
                         setState(() {

                         });
                       },),
                       Text(
                           'Edit',
                           style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,),
                       ),

                   ],
                ),
              ),
            ),
         SizedBox(height: 20,),
         Padding(
           padding: const EdgeInsets.only(left: 50),
           child: Column(
             children: [
               Row(
                 children: [
                   SvgPicture.asset("assets/images/person.svg",height: 19,width: 19,color: Colors.orange,),
                   SizedBox(width: 30,),
                   Text(
                       "${user?.name}",
                       style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,)),

                 ],
               ),
               Divider(
                 endIndent: 40,
                 indent: 40,
                 color: Colors.grey,
                 thickness: 0.2,
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: [
                   SvgPicture.asset("assets/images/person.svg",height: 19,width: 19,color: Colors.orange,),
                   SizedBox(width: 30,),
                   Text(
                       "${user?.fatherOrHusbandName}",
                       style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,)),

                 ],
               ),
               Divider(
                 endIndent: 40,
                 indent: 40,
                 color: Colors.grey,
                 thickness: 0.2,
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: [
                   SvgPicture.asset("assets/images/phone.svg",height: 19,width: 19,color: Colors.orange,),
                   SizedBox(width: 30,),
                   Text(
                       "${user!.mobileNumber}",
                       style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,)),

                 ],
               ),
               Divider(
                 endIndent: 40,
                 indent: 40,
                 color: Colors.grey,
                 thickness: 0.2,
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: [
                   SvgPicture.asset("assets/images/dob.svg",height: 19,width: 19,color: Colors.orange,),
                   SizedBox(width: 30,),
                   Text(
                       "${user!.dateOfBirth}",
                       style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,)),

                 ],
               ),
               Divider(
                 endIndent: 40,
                 indent: 40,
                 color: Colors.grey,
                 thickness: 0.2,
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: [
                   SvgPicture.asset("assets/images/email.svg",height: 13,width: 13,color: Colors.orange,),
                   SizedBox(width: 30,),
                   Text(
                       "${user!.email}",
                       style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,)),

                 ],
               ),
               Divider(
                 endIndent: 40,
                 indent: 40,
                 color: Colors.grey,
                 thickness: 0.2,
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: [
                   SvgPicture.asset("assets/images/maritalStatus.svg",height: 19,width: 19,color: Colors.orange,),
                   SizedBox(width: 30,),
                   Text(
                       "${user!.gender}",
                       style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,)),

                 ],
               ),
               Divider(
                 endIndent: 40,
                 indent: 40,
                 color: Colors.grey,
                 thickness: 0.2,
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: [
                   SvgPicture.asset("assets/images/maritalStatus.svg",height: 19,width: 19,color: Colors.orange,),
                   SizedBox(width: 30,),
                   Text(
                       "${user!.maritalStatus}",
                       style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,)),

                 ],
               ),
               Divider(
                 endIndent: 40,
                 indent: 40,
                 color: Colors.grey,
                 thickness: 0.2,
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: [
                   SvgPicture.asset("assets/images/org.svg",height: 19,width: 19,color: Colors.orange,),
                   SizedBox(width: 30,),
                   Text("${getOrganization(user!.organization)}",
                       style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,)),
                 ],
               ),
               Divider(
                 endIndent: 40,
                 indent: 40,
                 color: Colors.grey,
                 thickness: 0.2,
               ),
               SizedBox(
                 height: 20,
               ),
               Row(
                 children: [
                   SvgPicture.asset("assets/images/address.svg",height: 19,width: 19,color: Colors.orange,),
                   SizedBox(width: 30,),
                   Text(
                       "${user!.address}",
                       style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w400,)),

                 ],
               ),
               Divider(
                 endIndent: 40,
                 indent: 40,
                 color: Colors.grey,
                 thickness: 0.2,
               ),
               SizedBox(
                 height: 20,
               ),
             ],
           ),
         )
          ],
        ),
      ),
   ] ));

  }
}
