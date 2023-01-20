import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/util/widgetUtil.dart';

import 'menuItem.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final List<DrawerItem> _menuList = [
    DrawerItem("Notification", Icons.notifications),
    DrawerItem("Attendance", Icons.add),
    DrawerItem("My Classes", Icons.one_k),
    DrawerItem("Donation", Icons.money),
    DrawerItem("Activities ", Icons.local_activity),
    DrawerItem("Setting", Icons.settings),
    DrawerItem("'Addresses", Icons.add),
  ];

  List<Widget> getBannerBody(){
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
      appBar:AppBar(backgroundColor: const Color(0xffFFBF62),
        actions: <Widget>[
          // Using Stack to show Notification Badge
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {
            setState(() {
            });
          }),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Stack(
          children: [
            SizedBox(
              height: 360,
              width: double.infinity,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xffFFBF62)
                ),
                child: Row(
                  children: [
                    Image(image: AssetImage("")),
                  ],
                )
              ),
            ),
            Padding( padding: const EdgeInsets.only(top:220),
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(25.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top:16.0, left: 10),
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: _menuList.length,
                          itemBuilder: (context, index){
                            DrawerItem item = _menuList[index];
                            return ListTile(
                              leading: Icon(item.icon, size: 28, color: const Color(0xffFFBF62)),
                              title: Text(item.name, style:menuItemStyle()),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            );
                          }
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(alignment: Alignment.topLeft,
                    child: Padding(padding: const EdgeInsets.only(left:20),
                      child:
                      Text(
                        'Follow us',
                        style: GoogleFonts.montserrat(
                          //  textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  Row(
                    children: const [
                      SizedBox(width: 25),
                      Image(image: AssetImage("assets/images/whatsapp.png"), height: 35, width: 35,),
                      SizedBox(width: 15),
                      Image(image: AssetImage("assets/images/twitter.png"), height: 35, width: 35,),
                      SizedBox(width: 15),
                      Image(image: AssetImage("assets/images/fb.png"), height: 35, width: 35,),
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
        child: Column(
          children: [CarouselSlider(
            items: getBannerBody(),
            options: CarouselOptions(
              height: 200.0,
              // enlargeCenterPage: true,
              autoPlay: true,
              // aspectRatio: 16 / 9,
              // autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 100),
              viewportFraction: 1,
            ),
          ),
            SizedBox(height: 10),
            Row(
              children: [
            Expanded(child: Center(child: TextButton(...))),
    VerticalDivider(width: 1.0),
    Expanded(child: Center(child: TextButton(...))),
    ],
    ),
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      //set border radius more than 50% of height and width to make circle
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.account_box, size: 28, color: Color(0xffFFBF62)),
                        Text("Item: ${index+1}", style:menuItemStyle())
                      ],
                    ),
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  }

