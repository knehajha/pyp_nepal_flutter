import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pyp_nepal/network/Api_client.dart';

import '../network/model/nearbyClassModel.dart';
import '../util/progress_dialog.dart';
import '../util/uiUtil.dart';

class NBClassesDetail extends StatefulWidget {
  const NBClassesDetail({Key? key, required this.classDetails}) : super(key: key);

  final NearbyClassModel classDetails;

  @override
  State<NBClassesDetail> createState() => _NBClassesDetailState();
}

class _NBClassesDetailState extends State<NBClassesDetail> {

  static const CameraPosition _kInitialPosition = CameraPosition(target: LatLng(29.9023165, 77.9934347), zoom: 10.0, tilt: 0, bearing: 0);
  final Set<Marker> markers = Set();

  String? get classId => "";
  Set<Marker> _getMarkers() {
    //markers to place on map
    markers.add(Marker( //add first marker
      markerId: MarkerId("${this.widget.classDetails.id}"),
      position: LatLng(this.widget.classDetails.location[0], this.widget.classDetails.location[1]), //position of marker
      infoWindow: InfoWindow( //popup info
        title: '${this.widget.classDetails.address}',
        snippet: '${this.widget.classDetails.name}',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    return markers;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Classes"),),
      body: Padding(
        padding:  EdgeInsets.all(0.0),
        child: Expanded(
          child: Stack(
            children: [
          Container(
            height: 250,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: _kInitialPosition,
              markers: _getMarkers(),
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              padding: EdgeInsets.only(
                  bottom:MediaQuery.of(context).size.height*0.05),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left:5.0, right: 5, top: 180), child: Column(
              children: [
                Card(
                  color: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          const SizedBox(height: 20,),
                          const Image(image: AssetImage("assets/images/ramdev.png"),height: 90,width: 90,),
                          Text("Neha Jha", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 16, fontWeight: FontWeight.w500),)
                        ],
                      ),
                      const SizedBox(width: 24,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20,),
                            Text("Yoga Class", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 24, fontWeight: FontWeight.w500),),
                            const SizedBox(height: 10,),
                            Text("Patanjali Yog Samiti, Nepal", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 15, fontWeight: FontWeight.w300),),
                            const SizedBox(height: 10,),
                            Row(
                              children: [
                                Image.asset('assets/images/clock.png',width: 13,height: 13,),
                                const SizedBox(width: 10,),
                                Text("10AM -11AM", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                              ],
                            ),
                            const SizedBox(height: 14,),
                            Row(
                              children: [
                                Text("Client Rating", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 12, fontWeight: FontWeight.w500),),
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
                            const SizedBox(height: 14,),
                            Row(
                              children: [Text("Venue :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                                const SizedBox(width: 10,),
                                Text("Nepal", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                              ],
                            ),
                            const SizedBox(height: 14,),
                            Row(
                              children: [
                                Text("Distance :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                                const SizedBox(width: 2,),
                                Text("2km", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                                const SizedBox(width: 24,),
                                Text("Joined :", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w700),),
                                const SizedBox(width: 2,),
                                Text("24/01/2023", style: GoogleFonts.montserrat(color:Colors.black, fontSize: 14, fontWeight: FontWeight.w500),),
                              ],),

                            const SizedBox(height: 20,),
                            const Divider(
                              thickness: 2,
                              color: Color(0xfff4eada),
                            ),
                            const SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Row(
                                children: [
                                  Image.asset("assets/images/telephone-2.png",width:24,height: 24,),
                                  const SizedBox(width: 24,),
                                  Image.asset("assets/images/Icon simple-whatsapp.png",width:24,height: 24,),
                                ],

                              ),
                            )

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40,),
                ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70.0, vertical: 15.0),
                    primary: const Color(0xff6EB52B),
                    shape: const StadiumBorder(),
                  ),

                  child: Text(
                    "JOIN",
                    style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  onPressed: (){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(child: Text('Confirmation Details',style:GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600,),)),
                          content: Wrap(
                            children: [
                              Center(child: Text('Please Join to Confirm the Class',style:GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600,),)),
                              const SizedBox(height: 40,),
                              Center(child: Image.asset('assets/images/ConfrmAlert.png',height: 200,width: 200,)),
                              const SizedBox(height: 40,),
                              Center(child: Text('Class Details',style:GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w600,),)),
                              const SizedBox(height: 40,),
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal:50.0, vertical: 15.0),
                                      primary: const Color(0xffF2623D),
                                      shape: const StadiumBorder(),
                                    ),
                                    child: Text("NO", style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w700),),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  const SizedBox(width: 20,),
                                  ElevatedButton(

                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 50.0, vertical: 15.0),
                                        primary: const Color(0xff6EB52B),
                                        shape: const StadiumBorder(),
                                      ),

                                      child: Text("YES", style:  GoogleFonts.montserrat(color:Colors.black,  fontSize: 16, fontWeight: FontWeight.w700), ),
                                      onPressed: () async{
                                      //  showProgressDialog(context);
                                        var response = await joinClass(classId!);
                                        if (response.isSuccess) {
                                    // String message = "Class requested successfully";
                                    //       showToast(message);

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                  title: Center(
                                                      child: Text(
                                                        'Confirmed',
                                                        style: GoogleFonts.montserrat(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      )),
                                                  content: Wrap(
                                                    children: [
                                                      Center(
                                                          child: Image.asset(
                                                            'assets/images/confirmSuccess.png',
                                                            height: 200,
                                                            width: 200,
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                      ),
                                                      Center(
                                                          child: Text(
                                                            'Thank You!',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.w700,
                                                            ),
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                      ),
                                                      Center(
                                                          child: Text(
                                                            'Your Confirmed Class Details',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              fontSize: 16,
                                                              fontWeight:
                                                              FontWeight.w600,
                                                            ),
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                      ),
                                                      Center(
                                                          child: Text(
                                                            'You will be receiving a Confirmation email with details',
                                                            style: GoogleFonts
                                                                .montserrat(
                                                              fontSize: 10,
                                                              fontWeight:
                                                              FontWeight.w500,
                                                            ),
                                                          )),
                                                      const SizedBox(
                                                        height: 40,
                                                      ),
                                                      Center(
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                50.0,
                                                                vertical:
                                                                15.0),
                                                            primary: const Color(
                                                                0xffFA9A0B),
                                                            shape:
                                                            const StadiumBorder(),
                                                          ),
                                                          child: Text(
                                                            "DONE",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                          ),
                                                          onPressed: () => Navigator.pop(context)
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  elevation: 24,
                                                  shape:
                                                  const RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.all(
                                                        Radius.circular(16)),
                                                  ));
                                            });
                                      }}),
                                ],
                              )
                            ],
                          ),
                          elevation: 24,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(16))),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),


            ],
          ),
        ),
        ),



    );

    }
}

