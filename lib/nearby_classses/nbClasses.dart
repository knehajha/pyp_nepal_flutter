import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/nearby_classses/nbClassMap.dart';
import 'package:pyp_nepal/nearby_classses/nbClassesDetails.dart';
import 'package:pyp_nepal/network/Api_client.dart';
import 'package:pyp_nepal/util/map_util.dart';
import 'package:pyp_nepal/util/uiUtil.dart';

import '../network/Api_response.dart';
import '../network/model/nearbyClassModel.dart';

class NBClasses extends StatefulWidget {
  const NBClasses({Key? key}) : super(key: key);

  @override
  State<NBClasses> createState() => _NBClassesState();
}

class _NBClassesState extends State<NBClasses> {

  var isMap = true;

  List<NearbyClassModel> nbc = [];

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

  double _lat=0, _lng=0;
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

  @override
  void initState() {
    super.initState();
    _getCurrentPosition();
  }

  Widget _getIcon(){
    return isMap ? Image.asset('assets/images/appBarAddres.png',width: 30,height: 30,) : Icon(Icons.list_sharp, size: 30, color: Colors.white,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    title: const Text("Nearby Classes"),
        actions: <Widget>[
          IconButton(onPressed: (){
            setState(() {
              isMap = !isMap;
            });
            // Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => const NearbyClassMap()));
          }, icon: _getIcon(),)
        ]),
        body: isMap ? nbc.isEmpty ? Center(
          child:  CircularProgressIndicator(
            backgroundColor: Colors.redAccent,
            valueColor: AlwaysStoppedAnimation(Colors.green),
            strokeWidth: 3,
          ),
        ) : ListView.builder(
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
                    Navigator.of(context).push(MaterialPageRoute( builder: (BuildContext context) => NBClassesDetail(classDetails: nbc[index],)));
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
            }) : NBClassMap(nbc: nbc,),
    );


  }

  }

