
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
import 'package:pyp_nepal/Yoga%20Trainer/trainerUnderthem.dart';
import 'package:pyp_nepal/Yoga%20Trainer/yttpApplications.dart';
import 'package:pyp_nepal/network/Api_client.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';
import '../auth/login.dart';
import '../auth/sadhakProfile.dart';
import '../dashboard/menuItem.dart';
import '../network/Api_response.dart';
import '../network/model/dashboardClassModel.dart';
import '../network/model/fetchClass.dart';
import '../network/model/login_model.dart';
import '../util/app_preference.dart';
import '../util/myColour.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../util/progress_dialog.dart';
import '../util/uiUtil.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);


   void _getMyClasses() async {
     ApiResponse response =  await fetchClass();
     if(response.isSuccess){
       myClassesIds.clear();
       List<FetchClassModel> result = response.result;
       result.forEach((element) {
         myClassesIds.add(element.id);
       });
     }
   }

   @override
   void initState() {
    initState();
     _getMyClasses();

   }

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

  User? user;


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

  DashboardClassModel? dashboardModel = null;

    _getDataCount() async {
    ApiResponse response  = await dashboardClass();
    if(response!.isSuccess){
      setState(() {
        dashboardModel = response.result;
      });
    }else{
      showToast(response!.message);
    }
  }


  @override
  void initState() {
    super.initState();
    _getDataCount();
    user = getProfile();

  }


  String _getResult(int position) {
    String value = "0";
    if (dashboardModel != null)
      switch (position) {
        case 0:
          value = "${dashboardModel?.totakClasses}";
          break;
        case 1:
          value = "${dashboardModel?.totalSadhak}";
          break;
        case 2:
          value = "${dashboardModel?.totalTrainers}";
          break;
        case 3:
          value = "${dashboardModel?.attendance}";
          break;
        case 4:
          value = "${dashboardModel?.yttpApplications}";
          break;
        case 5:
          value = "${dashboardModel?.yttCondected}";
          break;
        case 6:
          value = "${dashboardModel?.totalScore}";

       }
    return value;
  }


  @override
  Widget build(BuildContext context) {
    var user = getProfile();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: Container(
            child: InkWell(
              onTap: (){
                Get.to(SadhakProfile());
              },
              child: Row(

                children: [
                  Padding(
                    padding:const EdgeInsets.only(left: 10,top: 5),
                      child: ClipOval(child: getProfilePictureViewTrainer(user == null ? "" : user!.image,))),

                  const SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome", style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                      Text("${user?.name}", style: GoogleFonts.poppins(color:Colors.white, fontSize: 18, fontWeight: FontWeight.w700),),
                      Text("${getOrganization(user?.organization)}", style: GoogleFonts.poppins(color:Colors.white, fontSize: 12, fontWeight: FontWeight.w300),),


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

        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              CarouselSlider(
                items: getBannerBody(),
                options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
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
                      child: Text("(Yoga Trainer)",style: GoogleFonts.poppins(color:Colors.black54, fontSize: 14, fontWeight: FontWeight.w400),
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
                          case 0:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) =>  const MyClassSadhak()));
                            break;
                          case 1:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => RegisteredSadhak("")));
                            break;
                          case 2:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) =>  TrainerUnder()));
                            break;
                          case 3:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const PunchInDetails()));
                            break;
                          case 4:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) =>  YttpApplications()));
                            break;
                          case 5:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const TeacherTrainingConduct()));
                            break;
                          case 6:
                            Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => RegisteredSadhak("")));
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
                                  Text(_getResult(index), style: GoogleFonts.poppins(color:Colors.black, fontSize: 20, fontWeight: FontWeight.w800),),
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

