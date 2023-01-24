import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearbyClassMap extends StatefulWidget {
  const NearbyClassMap({Key? key}) : super(key: key);

  @override
  State<NearbyClassMap> createState() => _NearbyClassMapState();
}

class _NearbyClassMapState extends State<NearbyClassMap> {
  static final LatLng _kMapCenter =
  LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
  CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:const Color(0xffFFBA01),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white,size: 30,),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("My Classes"),
          titleTextStyle: GoogleFonts.montserrat(color: const Color(0xffFFFFFF),
              fontSize: 18, fontWeight: FontWeight.w500)),

      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
      ),
    );
  }
}






