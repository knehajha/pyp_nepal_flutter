import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/Yoga%20Trainer/MyClassDetailSadhak.dart';
import 'package:pyp_nepal/Yoga%20Trainer/SadhakNbClassDetails.dart';
import 'package:pyp_nepal/Yoga%20Trainer/newClass.dart';
import 'package:pyp_nepal/Yoga%20Trainer/trainerHome.dart';
import 'package:pyp_nepal/Yoga%20Trainer/update_class.dart';

import '../nearby_classses/nbClassesDetails.dart';
import '../network/Api_client.dart';
import '../network/Api_response.dart';
import '../network/model/fetchClass.dart';
import '../network/model/nearbyClassModel.dart';
import '../util/map_util.dart';
import '../util/progress_dialog.dart';
import '../util/uiUtil.dart';

class MyClassSadhak extends StatefulWidget {
  const MyClassSadhak({Key? key}) : super(key: key);

  @override
  State<MyClassSadhak> createState() => _MyClassSadhakState();
}

class _MyClassSadhakState extends State<MyClassSadhak>with TickerProviderStateMixin {

  List<FetchClassModel> myClasses = [];
  ApiResponse? response = null;

  List<NearbyClassModel> nbc = [];

  double _lat=0, _lng=0;


  _getNearByClasses(String lat, String lng) async {
    ApiResponse response = await nearbyClass(lat, lng);
    if(response.isSuccess){
      setState(() {
        nbc = response.result;
      });
    }else{
      showToast(response.message);
    }

  }


  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _lat = position.latitude;
        _lng = position.longitude;
        print("my location>>${position.latitude},${position.longitude}");
        _getNearByClasses("${position.latitude}", "${position.longitude}");
      });

    }).catchError((e) {
      debugPrint(e);
      showToast(e.toString());
    });
  }



  // create always a api method when at landing time data required
  _getMyClasses() async {
    response  = await fetchClass();
    if(response!.isSuccess){
      setState(() {
        myClasses = response!.result;
      });
    }else{
      showToast(response!.message);
    }



  }
  late TabController _tabController;
  // call that method in initState[auto run it when page first come in front]
  @override
  initState()   {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _getMyClasses();
    _getCurrentPosition();
    }

   Widget _getEmptyView(){
        return Center(
          child: response == null ? CircularProgressIndicator() : Text("No result found!"),
        );
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:  Text("My Classes",
          style: GoogleFonts.publicSans(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),

      bottom: TabBar(
        indicatorColor: Colors.black26,
        labelStyle: GoogleFonts.montserrat(color:Colors.white,  fontSize: 16, fontWeight: FontWeight.w500),
        labelColor: Colors.white,
        controller: _tabController,
        tabs: <Widget>[
          Tab(
            text: "My Classes(${myClasses.length})",
          ),
          Tab(
            text: "Nearby Classes(${nbc.length})",
          ),
        ],
      ),
      ),
      body: myClasses.isEmpty ? _getEmptyView() :  TabBarView(
          controller: _tabController,
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.builder(

                      itemCount: myClasses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  Padding(
                          padding: const EdgeInsets.only(left:10, right: 10,),
                          child: Column(
                              children: [
                                InkWell(
                                  onTap:(){
                                      Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) =>SadhakClassDetail(classDetails: myClasses[index])));
                                  },
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(width: 20,),
                                        Column(
                                          children: [
                                            const Image(image: AssetImage("assets/images/ramdev.png"),height: 100,width: 100,),
                                            SizedBox(width: 100, child: Center(child: Text("${myClasses[index].trainerName}", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w500),overflow: TextOverflow.visible,)))
                                          ],
                                        ),

                                        const SizedBox(width: 24,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 10,),
                                              Row(children:[
                                                Text(myClasses[index].name, style: GoogleFonts.poppins(color:Colors.black, fontSize: 21, fontWeight: FontWeight.w500),),
                                                SizedBox(width: 25,),
                                                Flexible(

                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Flexible(
                                                        child: IconButton(
                                                            iconSize: 20,
                                                            icon: const Icon(Icons.edit,color: Colors.orange,),
                                                            onPressed: (
                                                                ) {
                                                              Get.to(UpdateClass(fm:myClasses[index]));
                                                            }
                                                        ),
                                                      ),
                                                      Flexible(
                                                      child:IconButton(
                                                        iconSize: 20,
                                                        icon: const Icon(Icons.delete,color: Colors.orange,),
                                                        onPressed: () {
                                                          deleteAlert(context);
                                                        },
                                                      ),
                                                      )],
                                                  ),
                                                )
                                              ]),
                                              const SizedBox(height: 10,),
                                              Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.poppins(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                                              const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Text("Established :", style: GoogleFonts.poppins(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                                                  const SizedBox(width: 10,),

                                                  Text("${myClasses[index].establishDate}", style: GoogleFonts.poppins(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                                                ],
                                              ),
                                              const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Image.asset('assets/images/clock.png',width: 13,height: 13,),
                                                  const SizedBox(width: 10,),
                                                  Text(myClasses[index].startTime, style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                                                  const SizedBox(width: 1,),
                                                  Text("-", style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                                                  const SizedBox(width: 1,),
                                                  Text(myClasses[index].endTime, style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                                                ],
                                              ),
                                              const SizedBox(height: 5,),
                                              Row(
                                                children: [
                                                  Text("Rating", style: GoogleFonts.poppins(color:const Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w500),),
                                                  const SizedBox(width: 4,),
                                                  RatingBar.builder(
                                                    initialRating: 3,
                                                    minRating: 1,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    itemCount: 5,
                                                    itemSize: 18.0,
                                                    itemBuilder: (context, _) => const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height:10,),
                                              Row(
                                                children: [
                                                  SvgPicture.asset("assets/images/location.svg",height:17, width: 17),
                                                  const SizedBox(width: 5,),
                                                  Flexible(child: Text(myClasses[index].address, style: GoogleFonts.poppins(color:const Color(0xff464646), fontSize: 12, fontWeight: FontWeight.w500),)),
                                                ],
                                              ),
                                              const SizedBox(height: 20,),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),
                                ),
                              ]),);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20,left: 50,right: 50),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFF0E132F),
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          "+ADD NEW CLASS",
                          style: GoogleFonts.montserrat(color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        onPressed: () =>
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                              builder: (context) => const NewClass(),


                            ))),
                  ),
                ),
              ],//
            ),
            (_lat == 0 || _lng == 0) ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Your location not available", style: GoogleFonts.montserrat(color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: 180,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0XFF0E132F),
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          "Enable location",
                          style: GoogleFonts.montserrat(color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                        onPressed: (){
                          _getCurrentPosition();
                        })
                  ),
                ],
              ),
            ) : Expanded(
              child: ListView.builder(
                  itemCount: nbc.length,
                  itemBuilder: (BuildContext context, int index) {
                    if(nbc[index].distance == 0){
                      double d = calculateDistance(_lat, _lng, nbc[index].lat, nbc[index].lng);
                      nbc[index].distance = d;
                    }

                    return  Padding(
                      padding: const EdgeInsets.only(left:10, right: 10,),
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => SadhakNearby(nbc: nbc[index])));
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20,),
                              Column(
                                children: [
                                  const Image(image: AssetImage("assets/images/ramdev.png"),height: 100,width: 100,),
                                  SizedBox(width: 100, child: Center(child: Text("${nbc[index].trainerName}", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w500),overflow: TextOverflow.visible,)))
                                ],
                              ),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20,),

                                    Text("${nbc[index].name}", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 20, fontWeight: FontWeight.w600),),
                                    const SizedBox(height: 10,),
                                    Text("${nbc[index].address}", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w400),),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Image.asset('assets/images/clock.png',width: 13,height: 13,),
                                        const SizedBox(width: 10,),
                                        Text("${nbc[index].startTime}", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                                        Text("-", style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                                        const SizedBox(width: 1,),
                                        Text("${nbc[index].endTime}", style: GoogleFonts.poppins(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),

                                      ],
                                    ),
                                    const SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Text("Rating", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
                                        const SizedBox(width: 3,),
                                        RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5, itemSize: 18.0,
                                          itemBuilder: (context, _) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 5,),
                                    const Divider(
                                      thickness: 1.5,
                                      color: Color(0xfff4eada),
                                    ),

                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/telephone-2.png",width:28,height: 28,),
                                        const SizedBox(width: 24,),
                                        Image.asset("assets/images/Icon simple-whatsapp.png",width:28,height: 28,),
                                        //const SizedBox(width: 50,),
                                        Spacer(),
                                        Row(
                                          children: [
                                            Text("Distance :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                                            const SizedBox(width: 2,),
                                            Text(nbc.isEmpty ? "0 KM" : "${nbc[index].distance} KM", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),)],),
                                        SizedBox(width: 20,),

                                      ],
                                    ),


                                    SizedBox(height: 20,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],

        ),



    );

  }
 }



