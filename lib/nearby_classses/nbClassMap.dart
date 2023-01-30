import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NBClassMap extends StatefulWidget {
  const NBClassMap({Key? key}) : super(key: key);

  @override
  State<NBClassMap> createState() => _NBClassMapState();
}

class _NBClassMapState extends State<NBClassMap> {
  static const CameraPosition _kInitialPosition = CameraPosition(target: LatLng(29.9023165, 77.9934347), zoom: 10.0, tilt: 0, bearing: 0);
  final Set<Marker> markers = new Set();
  Set<Marker> _getMarkers() { //markers to place on map
    markers.add( const Marker( //add first marker
      markerId: MarkerId("Patanjali, Haridwar"),
      position: LatLng(29.9023165, 77.9934347), //position of marker
      infoWindow: InfoWindow( //popup info
        title: 'Patanjali Yogpeeth Phase-1',
        snippet: 'Bahadrabad Haridwar',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _kInitialPosition,
      markers: _getMarkers(),
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}






