import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pyp_nepal/util/progress_dialog.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../network/Api_client.dart';
import '../network/Api_response.dart';
import '../network/model/pendingClassModel.dart';
import '../network/model/yogSadhakModel.dart';
import '../util/myColour.dart';
import '../util/uiUtil.dart';

class RegisteredSadhak extends StatefulWidget {
  final String _title;
  // const RegisteredSadhak({Key? key}) : super(key: key);
   RegisteredSadhak(this._title, {super.key});



  @override
  State<RegisteredSadhak> createState() => _RegisteredSadhakState ();
}

  class _RegisteredSadhakState extends  State<RegisteredSadhak> with TickerProviderStateMixin{


    List<YogSadhakModel> ys = [];

    _getYogSadhak() async {
      ApiResponse response  = await getYogSadhaks();
      if(response.isSuccess){
        ys = response.result;
        setState(() {

        });
      }else{
        showToast(response.message);
      }

    }

  List<PendingClassModel> frc = [];
  String status = "Please wait...";
  _getRequestedClasses() async {
    ApiResponse response  = await fetchRequestedClass();
    if(response.isSuccess){
      frc = response.result;
    }else{
      showToast(response.message);
    }

    setState(() {
      if(frc.isEmpty){
        status = "No record found";
      }
    });

  }

    late TabController _tabController;

  @override
  initState()   {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _getRequestedClasses();
    _getYogSadhak();
  }


  Widget _getEmptyView(){
    return Center(
      child: frc.isEmpty ? Center(
        child: Text(status),
      ) : Text("No records found!"),
    );
  }

  _openWhatsapp(String contact) async{
    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception{
      showToast('WhatsApp is not installed.');
    }
  }


 _call (String phone)async {
    final url =  Uri.parse('tel:$phone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text("Registered Sadhak",
          style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        titleSpacing: 00.02,
        elevation: 0.00,
        actions: [
          SvgPicture.asset("assets/images/noty.svg",height: 25,
            width: 25,
          ),
          const SizedBox(width: 20,)
        ],

        bottom: TabBar(
          indicatorColor: Colors.black26,
          labelStyle: GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w500),
          labelColor: Colors.white,
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: "Pending requests(${frc.length})",
                icon: Icon(Icons.query_builder),
              ),
              Tab(
                text: "Registered Sadhak(${ys.length})",
                icon: Icon(Icons.group),
              ),
            ],
        ),

      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(8.0,8,8,8),
              itemCount: frc.length,
              itemBuilder: (context, index) =>
                  Card(
                    elevation: 4,
                    child: Column(
                      children:    [
                        Row(
                          children:  [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(8,10,0,8),
                              child: Image(image: AssetImage("assets/images/ramdev.png"),height: 90,width: 90,),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8,),
                                  Text(frc[index].req.name, style: GoogleFonts.poppins(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                  const SizedBox(height: 8,),
                                  SizedBox(
                                    width: 160,
                                    child: Text(frc[index].req.address, style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 14, fontWeight: FontWeight.w400),
                                      maxLines:2,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  const SizedBox(height: 5,),

                                  Row(
                                    children: [

                                      SvgPicture.asset("assets/images/ic_mobile.svg",width:12,height: 12, color: Colors.orange,),
                                      const SizedBox(width: 8,),
                                      Text(frc[index].user.mobileNumber, style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 14, fontWeight: FontWeight.w600),),

                                    ],
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                      height: 35,
                                      width: 35,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                              side: const BorderSide(color:  ColorConstants.kSecondaryColor,width: 3.0),
                                            ),
                                            backgroundColor:Colors.white,
                                            elevation: 6
                                        ),
                                        onPressed: () {
                                          email(ys[index].email);
                                        },
                                        child: Center( child: SvgPicture.asset (
                                          "assets/images/ic_msg.svg", height: 16,width: 16,
                                        ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8,0,8,0),
                                    child: SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: TextButton(

                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50),
                                                side: const BorderSide(color:  ColorConstants.kSecondaryColor,width: 3.0),
                                              ),
                                              backgroundColor:Colors.white,
                                              elevation: 6
                                          ),
                                          onPressed: () {
                                            _openWhatsapp(frc[index].user.mobileNumber);
                                          },
                                          //     child:  const Center(child: Icon(Icons.camera_alt_outlined),),
                                          child:   Center( child: SvgPicture.asset(
                                            "assets/images/ic_whatsapp.svg", height: 16,width: 16,
                                          ),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,10,0),
                                    child: SizedBox(
                                        height: 35,
                                        width: 35,
                                        child: TextButton(

                                          style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(50),
                                                side: const BorderSide(color:  ColorConstants.kSecondaryColor,width: 3.0),
                                              ),
                                              backgroundColor:Colors.white,
                                              elevation: 6
                                          ),
                                          onPressed: () { _call(frc[index].user.mobileNumber);},
                                          //     child:  const Center(child: Icon(Icons.camera_alt_outlined),),
                                          child:   Center( child: SvgPicture.asset(
                                            "assets/images/ic_telephone.svg", height: 16,width: 16,
                                          ),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            )

                          ],
                        ),
                        SizedBox(height: 2,),
                        Padding(padding: EdgeInsets.only(left: 230),
                          child: Row(children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
                                primary: Colors.green,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () async{
                                showProgressDialog(context);
                                var response = await acceptClass(frc[index].reqId);
                                Navigator.of(context).pop();
                                if (response.isSuccess){
                                  Get.snackbar("Request accepted Successfully", response.message,
                                      colorText: Colors.black,
                                      backgroundColor: Colors.white,
                                      icon: const Icon(
                                        Icons.library_add_check,
                                        color: Colors.black38,
                                      ));
                                  _getRequestedClasses();
                                }

                                else {
                                  Get.snackbar("Error", response.message,
                                      colorText: Colors.white,
                                      backgroundColor: Colors.black,
                                      icon: const Icon(
                                        Icons.error_outline,
                                        color: Colors.white,
                                      ));
                                }},

                              child: Text(
                                "ACCEPT",
                                style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 2),
                                primary: Colors.red,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () async{
                                showProgressDialog(context);
                                var response = await rejectClass(frc[index].reqId);
                                Navigator.of(context).pop();
                                if (response.isSuccess){
                                  String message = "Request rejected Successfully!";
                                  showToast(message);}
                                else {
                                  Get.snackbar("Error", response.message,
                                      colorText: Colors.white,
                                      backgroundColor: Colors.black,
                                      icon: const Icon(
                                        Icons.error_outline,
                                        color: Colors.white,
                                      ));
                                }},
                              child: Text(
                                "REJECT",
                                style:  GoogleFonts.montserrat(color:Colors.white,  fontSize: 10, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],

                          ),
                        ),
                        const SizedBox(height: 10,),
                      ],

                    ),

                  )
          ), //Request pending list
          ListView.builder(
              shrinkWrap: true,
              padding:  EdgeInsets.fromLTRB(8.0,8,8,8),
              itemCount: ys.length,
              itemBuilder: (context, index) =>
                  Card(
                    elevation: 4,
                    child: Column(
                      children:    [
                        Row(
                          children:  [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(8,10,0,8),
                              child: Image(image: AssetImage("assets/images/ramdev.png"),height: 90,width: 90,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 8,),
                                  Text(ys[index].name, style: GoogleFonts.poppins(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w600),),
                                  const SizedBox(height: 8,),
                                  SizedBox(
                                    width: 160,
                                    child: Text(ys[index].address, style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 14, fontWeight: FontWeight.w400),
                                      maxLines:2,
                                      softWrap: true,
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    children: [

                                      SvgPicture.asset("assets/images/ic_mobile.svg",width:12,height: 12, color: Colors.orange,),
                                      const SizedBox(width: 8,),
                                      Text(ys[index].mobileNumber, style: GoogleFonts.poppins(color:ColorConstants.textColor, fontSize: 14, fontWeight: FontWeight.w600),),

                                    ],
                                  ),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 45,
                                          width: 45,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(50),
                                                  side: const BorderSide(color:  ColorConstants.kSecondaryColor,width: 3.0),
                                                ),
                                                backgroundColor:Colors.white,
                                                elevation: 6
                                            ),
                                            onPressed: () {
                                              email(ys[index].email);
                                            },
                                            child: Center( child: SvgPicture.asset (
                                              "assets/images/ic_msg.svg", height: 16,width: 16,
                                            ),
                                            ),
                                          )),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: SizedBox(
                                            height: 45,
                                            width: 45,
                                            child: TextButton(

                                              style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                    side: const BorderSide(color:  ColorConstants.kSecondaryColor,width: 3.0),
                                                  ),
                                                  backgroundColor:Colors.white,
                                                  elevation: 6
                                              ),
                                              onPressed: () {
                                                _openWhatsapp(ys[index].mobileNumber);
                                              },
                                              //     child:  const Center(child: Icon(Icons.camera_alt_outlined),),
                                              child:   Center( child: SvgPicture.asset(
                                                "assets/images/ic_whatsapp.svg", height: 16,width: 16,
                                              ),
                                              ),
                                            )),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16),
                                        child: SizedBox(
                                            height: 45,
                                            width: 45,
                                            child: TextButton(
                                              style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                    side: const BorderSide(color:  ColorConstants.kSecondaryColor,width: 3.0),
                                                  ),
                                                  backgroundColor:Colors.white,
                                                  elevation: 6
                                              ),
                                              onPressed: () { _call(ys[index].mobileNumber);},
                                              //     child:  const Center(child: Icon(Icons.camera_alt_outlined),),
                                              child:   Center( child: SvgPicture.asset(
                                                "assets/images/ic_telephone.svg", height: 16,width: 16,
                                              ),
                                              ),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 10,),
                      ],

                    ),

                  )
          ),//registered sadhak list
        ],
      ),
    );
  }
}