import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pyp_nepal/network/model/CurrentAtdModel.dart';
import 'package:pyp_nepal/network/model/classDetailModel.dart';
import 'package:pyp_nepal/network/model/fetchClass.dart';
import 'package:pyp_nepal/util/app_preference.dart';

import '../network/Api_client.dart';
import '../network/Api_response.dart';
import '../network/model/atdScoreModel.dart';
import '../network/model/createClassModel.dart';
import '../network/model/punchOutModel.dart';
import '../util/date_util.dart';
import '../util/map_util.dart';
import '../util/progress_dialog.dart';
import '../util/uiUtil.dart';

class MyClassesPunchIn extends StatefulWidget {
  const MyClassesPunchIn({Key? key, required this.classDetails,}) : super(key: key);

  final FetchClassModel classDetails;

  @override
  State<MyClassesPunchIn> createState() => _MyClassesPunchInState();
}

class _MyClassesPunchInState extends State<MyClassesPunchIn> {
  List<AttendanceModel> atds = [];
  AtdScoreModel? classAtt ;

  _getMyAtd() async {
    ApiResponse response  = await currentAttendance(this.widget.classDetails.id);
    if(response.isSuccess){
      setState(() {
        atds = response.result;
      });
    } else{
      showToast(response.message);
    }
  }

  _getClassAtdScore() async {
    ApiResponse response = await getAtdScore(this.widget.classDetails.id);
    if(response.isSuccess){
      setState(() {
        classAtt = response.result;
      });
    }else{
      showToast(response.message);
    }
  }




  // call that method in initState[auto run it when page first come in front]
  @override
  initState()   {
    super.initState();
    verifyPunchDetails();
    //load and keep current location for punch in
    _getCurrentPosition(false);
    _getClassAtdScore();
    _getMyAtd();
  }
  Widget _getEmptyView(){
    return Center(
      child: atds.isEmpty ? CircularProgressIndicator() : Text("No result found!"),
    );
  }


  String punchType = "IN";
  void verifyPunchDetails(){
    String? classId = getActivePunchClass();
    punchType = classId == this.widget.classDetails.id ? "OUT" : "IN";
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


  double _lat = 0;
  double _lng = 0;
  // method will call when the class load with fetching current location and second when user will tap to punch button with true parameter
  Future<void> _getCurrentPosition(bool isPunched) async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    showProgressDialog(context);
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _lat = position.latitude;
        _lng = position.longitude;
        print("my location>>${position.latitude},${position.longitude}");

        //if isPunch true ie: fetch the location and update to server
        if(isPunched){
          _punchIn();
        }
      });


      Navigator.of(context).pop();

    }).catchError((e) {
      debugPrint(e);
      showToast(e.toString());
    });
  }


  void _punchIn() async{
    showProgressDialog(context);
    Map<String, dynamic> body = HashMap();
    body["classId"] = "${this.widget.classDetails.id}";
    body["lat"] = _lat;
    body["lng"] = _lng;
    var response = await punchIn(body);
    Navigator.of(context).pop();
    if(response.isSuccess){
      showToast("Punched in successfully");
      updatePunch(this.widget.classDetails.id);
      setState(() {
        verifyPunchDetails();
        _getMyAtd();
      });
    }else{
      showToast(response.message);
    }
  }

  void _punchOut() async {
    showProgressDialog(context);
    var response = await punchOut(this.widget.classDetails.id);
    Navigator.of(context).pop();
    if(response.isSuccess){
      showToast("Punched out successfully");
      updatePunch("");
      setState(() {
        verifyPunchDetails();
        _getMyAtd();
      });
    }else{
      showToast(response.message);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Classes"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Colors.white,
              elevation: 1,
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
                            "${this.widget.classDetails.trainerName}",
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
                                "${this.widget.classDetails.name}",
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              this.widget.classDetails.address,
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
                                 "${this.widget.classDetails.startTime}",
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
                                  "${this.widget.classDetails.endTime}",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rating",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
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
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Venue :",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    "${this.widget.classDetails.address}",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Distance :",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "${calculateDistance(_lat, _lng, this.widget.classDetails.lat, this.widget.classDetails.lng)} KM",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                              ],
                            ),
                            const SizedBox(height: 14,),
                            Row(
                              children: [
                                Text(
                                "Joined :",
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text("${this.widget.classDetails.establishDate}",
                                style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis),]),

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
                                  Image.asset(
                                    "assets/images/attendance_meter.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Attendance",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 30),
                                        child: Text(
                                          '${classAtt?.result == null ? "0" : classAtt?.result.toInt()}%',
                                          style: GoogleFonts.montserrat(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 90,
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
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: SizedBox(
                        width: 160,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            splashFactory: NoSplash.splashFactory,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35.0, vertical: 15.0),
                            primary: punchType == "IN" ? const Color(0xff6EB52B) : const Color(0xffF2623D),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async{
                            String classId = getActivePunchClass() ?? "";
                            if(classId.isNotEmpty && punchType == "IN"){
                              showToast("Your are already punched in another class");//
                            }else if(punchType == "IN" && _lat == 0 || _lng == 0){
                              showToast("Fetching the location.....");
                              //load current location and update punch to server
                              _getCurrentPosition(true);
                            }else if(punchType == "IN"){
                              _punchIn();
                            }else{
                              _punchOut();
                            }
                          },

                          child: Text(punchType == "IN" ? "PUNCH IN" : "PUNCH OUT")
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: AlignmentDirectional.topStart,
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 24),
                child: Text(
                  "Attendance",
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )),
          const SizedBox(
            height: 18,
          ),
          Container(
            height: 60,
            color: const Color(0xffF5F5F5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Date",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "Punch In",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "Punch Out",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    "Punch Type",
                    style: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: atds.length,
              itemBuilder: (
                BuildContext context,
                int index,
              ) {
                return Container(
                  color: (index % 2 == 0)
                      ? const Color(0xffFFFFFF)
                      : const Color(0xffF5F5F5),
                  child: ListTile(
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(atds[index].punchDate,
                            style: GoogleFonts.montserrat(
                                color: const Color(0xff464646),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                              child: Text(parseDate(atds[index].punchIn),
                            style: GoogleFonts.montserrat(
                                color: const Color(0xff464646),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                              child: Text(parseDate(atds[index].punchOut),
                            style: GoogleFonts.montserrat(
                                color: const Color(0xff464646),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )),
                          Expanded(
                              child: Text(
                            "Self",
                            style: GoogleFonts.montserrat(
                                color: const Color(0xff464646),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
