import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../network/model/nearbyClassModel.dart';

class SadhakNearby extends StatefulWidget {
  const SadhakNearby({Key? key, required this.nbc}) : super(key: key);

  final NearbyClassModel nbc;


  @override
  State<SadhakNearby> createState() => _SadhakNearbyState();
}

class _SadhakNearbyState extends State<SadhakNearby> {

  static const CameraPosition _kInitialPosition = CameraPosition(
      target: LatLng(29.9023165, 77.9934347), zoom: 10.0, tilt: 0, bearing: 0);
  final Set<Marker> markers = Set();
  Set<Marker> _getMarkers() {
    //markers to place on map
    markers.add(Marker(
      //add first marker
      markerId: MarkerId("${this.widget.nbc.id}"),
      position: LatLng(this.widget.nbc.location[0],
          this.widget.nbc.location[1]), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: '${this.widget.nbc.address}',
        snippet: '${this.widget.nbc.name}',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    return markers;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: const Text("Nearby Classes"),
      ),

body:  Padding(
        padding: EdgeInsets.all(0.0),
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
    bottom: MediaQuery.of(context).size.height * 0.05),
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(left: 5.0, right: 5, top: 180),
    child: Column(
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
    const SizedBox(
    width: 20,
    ),
    Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    const SizedBox(
    height: 20,
    ),
    const Image(
    image: AssetImage("assets/images/ramdev.png"),
    height: 90,
    width: 90,
    ),
    SizedBox(
    width: 100,
    child: Center(
    child: Text(
    this.widget.nbc.trainerName,
    style: GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500),
    )))
    ],
    ),
    const SizedBox(
    width: 24,
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
    this.widget.nbc.name,
    style: GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.w600),
    ),
    const SizedBox(
    height: 10,
    ),
    Text(
    this.widget.nbc.address,
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
    this.widget.nbc.startTime,
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
    this.widget.nbc.endTime,
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
    Flexible(
    child: Text(
    this.widget.nbc.address,
    style: GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500),
    overflow: TextOverflow.visible,
    )),
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
    "${this.widget.nbc.distance} KM",
    style: GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500),
    ),
    ],
    ),
    const SizedBox(
    height: 14,
    ),
    Row(
    children: [
    Text(
    "Joined :",
    style: GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w700),
    ),
    const SizedBox(
    width: 2,
    ),
    Text(
    "${this.widget.nbc.establishDate}",
    style: GoogleFonts.montserrat(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500),
    ),
    ],
    ),
    const SizedBox(
    height: 20,
    ),
    const Divider(
    thickness: 2,
    color: Color(0xfff4eada),
    ),
    const SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Row(
    children: [
    Image.asset(
    "assets/images/telephone-2.png",
    width: 32,
    height: 32,
    ),
    const SizedBox(
    width: 24,
    ),
    Image.asset(
    "assets/images/Icon simple-whatsapp.png",
    width: 32,
    height: 32,
    ),
    ],
    ),
    )
    ],
    ),
    ),
    ],
    ),
    ),
    const SizedBox(
    height: 40,
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
