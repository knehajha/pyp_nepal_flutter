import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import 'menuItem.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<GridItem> _menuList = [
   GridItem("Notification", "assets/images/notification.png"),
    GridItem("Attendance", "assets/images/attendance.png"),
    GridItem("My Classes", "assets/images/my_classes.png"),
    GridItem("Donation", "assets/images/donation.png"),
    GridItem("Activities ", "assets/images/activities.png"),
    GridItem("Setting", "assets/images/setting.png"),
    GridItem("Addresses", "assets/images/address.png"),
  ];

  final List<GridItem> _gridviewList = [
    GridItem("All classes", "assets/images/all_classes.png"),
    GridItem("My Class", "assets/images/activities.png"),
    GridItem("Attendance", "assets/images/attendance.png"),
    GridItem("Donation", "assets/images/donation.png"),
    GridItem("Activities ", "assets/images/all_classes.png"),
    GridItem("Setting", "assets/images/all_classes.png"),
  ];

  List<Widget> getBannerBody() {
    List<Widget> wlist = [];
    List<String> urls = [
      "https://dailyburn.com/life/wp-content/uploads/2017/09/AMDU-7234_Daily_Burn_940x400_4.png",
      "https://dailyburn.com/life/wp-content/uploads/2017/09/AMDU-7234_Daily_Burn_940x400_5.png",
      "https://dailyburn.com/life/wp-content/uploads/2017/09/AMDU-7234_Daily_Burn_940x400_10.png"
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8F6),
      appBar: AppBar(
        backgroundColor: Colors.orange,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage("assets/images/ramdev.png"),height: 100,width: 100,),
                      SizedBox(width: 16,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text("Neha Jha", style: GoogleFonts.montserrat(color:Colors.white, fontSize: 18, fontWeight: FontWeight.w700),),
                          Text("Mahila Simiti Nepal", style: GoogleFonts.montserrat(color:Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
                          Text("Sadhak", style: GoogleFonts.montserrat(color:Colors.white, fontSize: 12, fontWeight: FontWeight.w400),)
                        ],
                      )
                    ],
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
                              onTap: () {
                                Navigator.pop(context);
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
                    children: const [
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
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
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
                      SizedBox(height: 20,),
                  Text(
                    'Yoga Score Level',
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),

                  Text(
                    '75%',
                    style: GoogleFonts.montserrat(
                        color: (const Color(0xffFF9F01)),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ]),

                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10,left: 16,right:12),
                  child: Container(width: 1,color: Color(0xffCCBFBFBF),),
                ),
                Image(
                  image: const AssetImage("assets/images/progressbar.png"),
                  height: 150,
                  width: 150,
                ),
              ],
            ),
          ),

          Container(height: 1,color: Color(0xffCCBFBFBF),),

          SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              itemCount: _gridviewList.length,
              itemBuilder: (context, index) => Card(
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
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
