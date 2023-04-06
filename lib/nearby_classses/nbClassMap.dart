import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../network/model/nearbyClassModel.dart';

class NBClassMap extends StatefulWidget {
  const NBClassMap({Key? key, required this.nbc}) : super(key: key);

  final List<NearbyClassModel> nbc;

  @override
  State<NBClassMap> createState() => _NBClassMapState();
}

class _NBClassMapState extends State<NBClassMap> {
  static const CameraPosition _kInitialPosition = CameraPosition(target: LatLng(29.9023165, 77.9934347), zoom: 10.0, tilt: 0, bearing: 0);
  final Set<Marker> markers = new Set();
  Set<Marker> _getMarkers() {
    print("markers added>>${this.widget.nbc.length}");
    for(NearbyClassModel nM in this.widget.nbc){
      markers.add(Marker( //add first marker
        markerId: MarkerId(nM.id),
        position: LatLng(nM.location[0], nM.location[1]), //position of marker
        infoWindow: InfoWindow( //popup info
          title: '${nM.name}',
          snippet: '${nM.address}',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return this.widget.nbc == null ? Center() : GoogleMap(
      initialCameraPosition: _kInitialPosition,
      markers: _getMarkers(),
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}






