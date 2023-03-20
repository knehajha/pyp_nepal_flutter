

import 'dart:collection';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/Yoga%20Trainer/DonationDetails.dart';
import 'package:pyp_nepal/Yoga%20Trainer/myClassesSadhak.dart';
import 'package:pyp_nepal/Yoga%20Trainer/newClass.dart';
import 'package:pyp_nepal/Yoga%20Trainer/punchInDetails.dart';
import 'package:pyp_nepal/Yoga%20Trainer/registeredSadhak.dart';
import 'package:pyp_nepal/Yoga%20Trainer/sadhakAttendingClass.dart';
import 'package:pyp_nepal/Yoga%20Trainer/teacherTrainingConduct.dart';
import 'package:pyp_nepal/Yoga%20Trainer/yttpApplications.dart';
import 'package:pyp_nepal/dashboard/dashboard.dart';
import 'package:pyp_nepal/network/Api_client.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';

import '../auth/login.dart';
import '../dashboard/menuItem.dart';
import '../network/Api_response.dart';
import '../network/model/dashboardClassModel.dart';
import '../util/CustomPaint.dart';
import '../util/app_preference.dart';
import '../util/myColour.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../util/progress_dialog.dart';
import '../util/uiUtil.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red,
      ),
      home: const TrainerHome(),

    );
  }
}

class TrainerHome extends StatefulWidget {
  const TrainerHome({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState()  => _TrainerHome();

}

class _TrainerHome extends State<StatefulWidget> {

  List<Widget> getBannerBody() {
    List<Widget> wlist = [];
    List<String> urls = [
      "assets/images/sliderPic1.jpg",
      "assets/images/sliderPic2.jpg",
      "assets/images/sliderPic3.jpg"
    ];
    urls.forEach((url) {
      Container container = Container(
        margin: const EdgeInsets.all(8.0),
        decoration: getBannerDecoration(url),
      );

      wlist.add(container);
    });

    return wlist;
  }






  final List<HomeItem> _homeList = [
    HomeItem("11","My Classes", "assets/images/home1.svg", ColorConstants.kPrimaryColor),
    HomeItem("20","Registered\nSadhak", "assets/images/home2.svg", ColorConstants.kSecondaryColor),
    HomeItem("04","Trainers Under\nThem", "assets/images/home3.svg",ColorConstants.kThirdSecondaryColor),
    HomeItem("80%","Attendance\nGoal Reaching", "assets/images/home4.svg", ColorConstants.kFourSecondaryColor),
    HomeItem("10","YTTP\nApplications ", "assets/images/home5.svg", ColorConstants.kFiveSecondaryColor),
    HomeItem("02","Teacher Training\nConducted", "assets/images/home6.svg", ColorConstants.kSixSecondaryColor),
    HomeItem("80%","Total\nScore", "assets/images/home7.svg", ColorConstants.kSevenSecondaryColor),
    HomeItem("₹ 35000","Donation\nCollected", "assets/images/home8.svg", ColorConstants.kEigthSecondaryColor),
  ];
  final List<Color> _homeColor = [ColorConstants.kPrimaryColor, ColorConstants.kSecondaryColor,ColorConstants.kThirdSecondaryColor,ColorConstants.kFourSecondaryColor,
    ColorConstants.kFiveSecondaryColor, ColorConstants.kSixSecondaryColor,ColorConstants.kSevenSecondaryColor,ColorConstants.kEigthSecondaryColor];

  Map<String, int> dataCount = HashMap();
  ApiResponse? response = null;

  _getDataCount() async {
    response  = await dashboardClass();
    if(response!.isSuccess){
      setState(() {
        dataCount = response!.result;
      });
    }else{
      showToast(response!.message);
    }
  }

  @override
  void initState() {
    super.initState();
    _getDataCount();
  }


  @override
  Widget build(BuildContext context) {
    var user = getProfile();
    return Scaffold(
        appBar: AppBar(

         /* title:  Text("Shree Ram",
            style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          ),*/
          toolbarHeight: 90,

          title: Container(
           // color: Colors.red,
            child: Row(

             // mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                    "assets/images/ramdev.png",
                    fit: BoxFit.contain,
                    height: 75,
                  ),


                const SizedBox(width: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome", style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                    Text("${user?.name}", style: GoogleFonts.poppins(color:Colors.white, fontSize: 18, fontWeight: FontWeight.w700),),
                    Text("Patanjali Yog Samiti", style: GoogleFonts.poppins(color:Colors.white, fontSize: 12, fontWeight: FontWeight.w300),),
                  ],
                ),
                const SizedBox(width: 40,),
                IconButton(
                  icon: const Icon(
                    Icons.logout,size: 30,color: Colors.orange,
                  ),
                  onPressed: () {
                    logout();
                    Get.offAll(Login);
                  },),
              ],
            ),
          ),
            actions: <Widget>[
        // Using Stack to show Notification Badge
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            logoutAlert(context);
          }),
        ),
    ],

        ),
      /*  appBar: AppBar(
        toolbarHeight: 120.10, //set your height
        flexibleSpace: SafeArea(
        child: Container(
        color: Colors.blue, // set your color
        child: Column(
        children: [
        Row(
        children: [Text("Logo")],
    ),
    Text("data"), // set an icon or image
    IconButton(
    icon: Icon(Icons.search),
    onPressed: () {}) // set your search bar setting
    ],
    ),
    ),
        ),
        ),*/
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
             /* Container(
                color: Colors.red,
                height: 170,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25,40,25,30),
                  child: Row(
                    children:  [
                       const Image(image: AssetImage("assets/images/ramdev.png"),height: 80,width: 80,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8,0,0,8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Welcome", style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                            Text("Shree Ram", style: GoogleFonts.poppins(color:Colors.white, fontSize: 18, fontWeight: FontWeight.w700),),
                            Text("Patanjali Yog Samiti", style: GoogleFonts.poppins(color:Colors.white, fontSize: 12, fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ),
                       const Spacer(),
                       SvgPicture.asset("assets/images/noty.svg",height: 25,
                       width: 25,
                           )
                    ],
                  ),
                )
              ),*/

              CarouselSlider(
                items: getBannerBody(),
                options: CarouselOptions(
                  height: 200.0,
                  // enlargeCenterPage: true,
                  autoPlay: true,
                  // aspectRatio: 16 / 9,
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  viewportFraction: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30,10,0,5),
                child: Row(
                  children: [
                    Text("Dashboard",style: GoogleFonts.poppins(color:Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 0, 0),
                      child: Text("(Yog Trainer)",style: GoogleFonts.poppins(color:Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                 child: GridView.builder(

                   padding: const EdgeInsets.all(8.0),
              itemCount: _homeList.length,
              itemBuilder: (context, index) =>
                    InkWell(
                      onTap: () async {
                        switch(index){
                          case 0:// All classes
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) =>  const MyClassSadhak()));
                            break;
                          case 1:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const RegisteredSadhak("Registered Sadhak")));
                            break;
                          case 2:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) =>  RegisteredSadhak("Trainers Under Them")));
                            break;
                          case 3:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const PunchInDetails()));
                            break;
                          case 4:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const YttpApplications()));
                            break;
                          case 5:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const TeacherTrainingConduct()));
                            break;
                          case 6:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) =>  RegisteredSadhak("Total Score")));
                            break;
                          case 7:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const DonationHistory()));
                            break;



                        }

                    },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(2.0),
                        child: Card(

                         /* semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,*/

                          color: _homeColor[index],

                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 15, 10, 0),
                                child: SvgPicture.asset(
                                  _homeList[index].imagePath,
                                  width: 35,
                                  height: 35,
                                ),
                              ),
                              Column(

                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 15),
                                  Text(_homeList[index].count, style: GoogleFonts.poppins(color:Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
                                  const SizedBox(height: 5),
                                  Text(_homeList[index].name, style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / .6,),


              ),
            ),




            ],
          ),
        )
    );
  }
}

