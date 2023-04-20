import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/attendance/attendance.dart';
import 'package:pyp_nepal/auth/login.dart';
import 'package:pyp_nepal/auth/update_profile.dart';
import 'package:pyp_nepal/donation/donation.dart';
import 'package:pyp_nepal/myclasses/myClasses.dart';
import 'package:pyp_nepal/network/Api_client.dart';
import 'package:pyp_nepal/network/model/atdScoreModel.dart';
import 'package:pyp_nepal/util/app_preference.dart';
import 'package:pyp_nepal/util/progress_dialog.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';

import '../auth/sadhakProfile.dart';
import '../nearby_classses/nbClasses.dart';
import '../network/Api_response.dart';
import '../network/model/fetchClass.dart';
import '../network/model/login_model.dart';
import '../util/uiUtil.dart';
import 'menuItem.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);


  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  AtdScoreModel? att ;

  User? user;

  final List<GridItem> _menuList = [
   GridItem("Notification", "assets/images/notification.png"),
    GridItem("Attendance", "assets/images/attendance.png"),
    GridItem("My Classes", "assets/images/my_classes.png"),
    GridItem("Donation", "assets/images/donation.png"),
    GridItem("Activities ", "assets/images/activities.png"),
    GridItem("Settings", "assets/images/setting.png"),
    GridItem("Addresses", "assets/images/address.png"),
  ];

  final List<GridItem> _gridviewList = [
    GridItem("Nearby Classes", "assets/images/all_classes.png"),
    GridItem("My Classes", "assets/images/my_classes.png"),
    GridItem("Attendance", "assets/images/attendance.png"),
    GridItem("Donation", "assets/images/donation.png"),
    GridItem("Activities ", "assets/images/activities.png"),
    GridItem("Settings", "assets/images/setting.png"),
  ];



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


  @override
  void initState() {
    super.initState();
    user = getProfile();
    _getAtdScore();
    _getMyClasses();
  }

  FetchClassModel? activeClass = null;
  List<FetchClassModel> myClasses = [];
  void _getMyClasses() async {
    String? classId = getActivePunchClass();
    ApiResponse response =  await fetchClass();
    if(response.isSuccess){
      myClassesIds.clear();
      List<FetchClassModel> result = response.result;
      myClasses = result;
      result.forEach((element) {
        myClassesIds.add(element.id);
        if(classId == element.id){
          activeClass = element;
        }
      });
      setState(() {
      });
    }
  }

  _refreshPage(){
    if(myClasses.isNotEmpty){
      String? classId = getActivePunchClass();
      myClasses.forEach((element) {
        myClassesIds.add(element.id);
        if(classId == element.id){
          activeClass = element;
        }
      });

      setState(() {

      });
    }
  }

  _getAtdScore() async {
    ApiResponse response = await getAtdScore();
    if(response.isSuccess){
      setState(() {
        att = response.result;
      });
    }else{
      showToast(response.message);
    }
  }

  void _punchOut() async {
    showProgressDialog(context);
    var response = await punchOut(activeClass!.id);
    Navigator.of(context).pop();
    if(response.isSuccess){
      showToast("Punched out successfully");
      updatePunch("");
      setState(() {
        activeClass = null;
      });
    }else{
      showToast(response.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8F6),
      appBar: AppBar(
        title: const Text("Dashboard",),
        actions: <Widget>[
          // Using Stack to show Notification Badge
          IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                setState(() {});
              }),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Stack(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.orange),
                  child: InkWell(
                    onTap:() {
                      Get.to(SadhakProfile());
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(child: getProfilePictureView(user == null ? "" : user!.image)),
                        const SizedBox(width: 16,),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10,),
                              Text("${user?.name}", style: GoogleFonts.montserrat(color:Colors.white, fontSize: 18, fontWeight: FontWeight.w700),overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 2,),
                              Text("${getOrganization(user?.organization)}", style: GoogleFonts.montserrat(color:Colors.white, fontSize: 14, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,),
                              SizedBox(height: 2,),
                              Text("Sadhak", style: GoogleFonts.montserrat(color:Colors.white, fontSize: 12, fontWeight: FontWeight.w400), overflow: TextOverflow.ellipsis,)
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: _menuList.length,
                          itemBuilder: (context, index) {
                            GridItem item = _menuList[index];
                            return ListTile(
                              leading: Image(
                                image: AssetImage(_menuList[index].imagePath),
                                height: 24,
                                width: 24,
                              ),
                              title: Text(item.name, style: menuItemStyle()),
                              onTap: () async {
                                switch(index){
                                  case 0:
                                    Get.to(const Donation());
                                    break;
                                  case 1:
                                    await Get.to( Attendance(myClasses: myClasses,));
                                    break;
                                  case 2:
                                    await Get.to(const MyClasses());
                                    _refreshPage();
                                    print("back from my classes");
                                    break;
                                  case 3:
                                    Get.to(const Donation());
                                    break;
                                  case 4:
                                    Get.to(const Donation());
                                    break;
                                  case 5:
                                    Get.to(const Donation());
                                    break;
                                  case 6:
                                    Get.to(const Donation());
                                    break;
                                }
                                // Navigator.pop(context);
                              },
                            );
                          }),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Follow us',
                        style: GoogleFonts.montserrat(
                          //  textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    children:  const [
                      SizedBox(width: 25),
                      Image(
                        image: AssetImage("assets/images/whatsapp.png"),
                        height: 40,
                        width: 40,

                      ),
                      SizedBox(width: 15),
                      Image(
                        image: AssetImage("assets/images/twitter.png"),
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 15),
                      Image(
                        image: AssetImage("assets/images/fb.png"),
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(height: 20,),

                    ],
                  ),
                const SizedBox(height: 40,),
                  Column(
                      children: [
                       Padding(
                         padding: const EdgeInsets.only(left: 20),
                         child: Align(
                            alignment: Alignment.topLeft,
                            child:
                            TextButton.icon(
                              onPressed: () {
                                logoutAlert(context);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white, // Background color
                              ),

                              icon: Icon( Icons.logout,size: 26.0,color: Colors.orange,),
                              label: Text('Logout', style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),),
                          ),
                          ),
                       ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
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
          const SizedBox(height: 5),
          Container(
            height: 80,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(height: 20,),
                  Text(
                    'Yoga Score Level',
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),


                  Text(
                   '${att?.result == null ? "0" : att?.result.toInt()}%' ,
                    style: GoogleFonts.montserrat(
                        color: (const Color(0xffFF9F01)),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ]),

                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10,left: 16,right:12),
                  child: Container(width: 1,color: const Color(0xffCCBFBFBF),),
                ),
                const Image(
                  image: AssetImage("assets/images/progressbar.png"),
                  height: 150,
                  width: 150,
                ),
              ],
            ),
          ),
          Container(height: 1,color: Color(0xffccbfbfbf),),
          const SizedBox(height: 20,),
          Expanded(

            child: GridView.builder(
              itemCount: _gridviewList.length,

              itemBuilder: (context, index) =>
                  InkWell(
                    onTap: () async {
                      switch(index){
                        case 0:// All classes
                          Get.to(const NBClasses());
                          break;
                        case 1:
                          User? profile = getProfile();
                          if(profile == null){
                            Get.offAll(const Login());
                          }else{
                            await Get.to(const MyClasses());
                            _refreshPage();
                            print("back from my classes");
                          }
                          break;
                        case 2:
                          User? profile = getProfile();
                          if(profile == null){
                            Get.offAll(const Login());
                          }else{
                            Get.to(Attendance(myClasses: myClasses,));
                          }
                          break;
                        case 3:
                          User? profile = getProfile();
                          if(profile == null){
                            Get.offAll(const Login());
                          }else{
                            Get.to(const Donation());
                          }
                          break;
                      }
                    },
                    child: Card(
                      color: Colors.white,
                      elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(
                          _gridviewList[index].imagePath,
                        ),
                        height: 35,
                        width: 35,
                      ),
                      const SizedBox(height: 10),
                      Text(_gridviewList[index].name, style: menuItemStyle())
                    ],
                ),
              ),
                  ),

              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,

              ),
            ),
          ),
          Visibility(
            visible: activeClass != null,
              child: activeClass == null ? Container() : Card(
                color: Colors.white,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Image(
                              image: AssetImage("assets/images/ramdev.png"),
                              height: 90,
                              width: 90,
                            ),
                            Text(
                              "${activeClass!.trainerName}",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                "${activeClass!.name}",
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                activeClass!.address,
                                style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/clock.png',
                                    width: 13,
                                    height: 13,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${activeClass!.startTime}",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "-",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "${activeClass!.endTime}",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),


                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                thickness: 2,
                                color: Color(0xfff4eada),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 130,
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            splashFactory: NoSplash.splashFactory,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20.0, vertical: 15.0),
                                            primary: const Color(0xffF2623D),
                                            shape: const StadiumBorder(),
                                          ),
                                          onPressed: () async{
                                            _punchOut();
                                          },

                                          child: Text("PUNCH OUT", style: TextStyle(color: Colors.white),)
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/telephone-2.png",
                                          width: 24,
                                          height: 24,
                                        ),
                                        const SizedBox(
                                          width: 18,
                                        ),
                                        Image.asset(
                                          "assets/images/Icon simple-whatsapp.png",
                                          width: 24,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
          ),
      ]

      ),
    )
    );
  }
}
