import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/destination.dart';
class PlaceMap extends StatelessWidget {
  static const String routeName = '/place-map';
  int placeId;
  Destination destination;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    args.containsKey('id') ? placeId = args['id'] : print('no key found');
    destination = destinations.firstWhere((dest) {
      return dest.id == placeId;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(destination.name),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            zoom: 14,
            target: LatLng(destination.lat, destination.lng),
          ),
          onMapCreated: (GoogleMapController controller) {},
        ),
      ),
    );
  }
}
