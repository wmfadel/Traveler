import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/map_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/destination.dart';
import '../models/map_place.dart';
import '../widgets/map_option.dart';
import '../widgets/info_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlaceMap extends StatefulWidget {
  static const String routeName = '/place-map';

  @override
  _PlaceMapState createState() => _PlaceMapState();
}

class _PlaceMapState extends State<PlaceMap> {
  int placeId;
  Destination destination;
  double screenWidth, screenHeight;
  Orientation orientation;
  Completer<GoogleMapController> _controller = Completer();
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  var markers = Set<Marker>.of([]);
  MapProvider mapProvider;
  PersistentBottomSheetController controller;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    args.containsKey('id') ? placeId = args['id'] : print('no key found');
    destination = destinations.firstWhere((dest) {
      return dest.id == placeId;
    });
    mapProvider = Provider.of<MapProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(destination.name),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                zoom: 14,
                target: LatLng(destination.lat, destination.lng),
              ),
              compassEnabled: true,
              mapToolbarEnabled: true,
              myLocationButtonEnabled: true,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              markers: markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: new SearchFab(
              onTap: buildSearchBottomSheet,
            ),
          )
        ],
      ),
    );
  }

  addMarkers() async {
    print('adding markers');
    markers.clear();
    setState(() {});
    mapProvider.places.forEach((MapPlace mapPlace) {
      markers.add(Marker(
          markerId: MarkerId('${mapPlace.id}-${math.Random(24)}'),
          position: LatLng(mapPlace.lat, mapPlace.lng),
          infoWindow: InfoWindow(
              title:
                  '${mapPlace.name} - rate: ${mapPlace.rating != null ? mapPlace.rating : 'not rated'}',
              snippet: mapPlace.vicinity),
          onTap: () {
            buildPlaceBottomSheet(mapPlace);
          }));
    });
    print('places count ${mapProvider.places.length}');
    print('markers count ${markers.length}');
    setState(() {});
  }

  buildPlaceBottomSheet(MapPlace mapPlace) {
    _closeModalBottomSheet();
    controller = _globalKey.currentState.showBottomSheet(
      (context) {
        return Container(
            width: screenWidth,
            padding: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Text(
                    mapPlace.name,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    mapPlace.vicinity,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Wrap(
                  children: <Widget>[
                    InfoChip(
                      'rate',
                      mapPlace.rating.toString(),
                      color: Colors.blueAccent,
                    ),
                    ...mapPlace.types.map((String tile) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        child: Chip(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            label: Text(
                              tile,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            )),
                      );
                    }).toList()
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth,
                  height: 160,
                  child: Image.network(
                    'https://maps.googleapis.com/maps/api/place/photo?photoreference=${mapPlace.photo_reference}&maxheight=300&maxwidth=600&key=YOUR_API_KEY',
                    width: screenWidth,
                    height: 150,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ));
      },
      elevation: 20,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
    );
  }

  void _closeModalBottomSheet() {
    if (controller != null) {
      controller.close();
      controller = null;
    }
  }

  buildSearchBottomSheet() {
    _globalKey.currentState.showBottomSheet(
      (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          height: orientation == Orientation.portrait ? 470 : 270,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: screenWidth,
                  height: orientation == Orientation.portrait ? 450 : 250,
                  child: GridView(
                    primary: false,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            orientation == Orientation.portrait ? 4 : 8),
                    children: <Widget>[
                      MapOption(
                        iconData: Icons.hotel,
                        label: 'Hotels',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: Icons.restaurant,
                        label: 'Food',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.wineGlass,
                        label: 'Bar',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.coffee,
                        label: 'Caffe',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.hospital,
                        label: 'Hospital',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.balanceScale,
                        label: 'Police',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.school,
                        label: 'Schools',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.university,
                        label: 'Univiristy',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.clinicMedical,
                        label: 'Clinics',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.tree,
                        label: 'Forests',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.book,
                        label: 'Library',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.building,
                        label: 'Garage',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.landmark,
                        label: 'Museum',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.gasPump,
                        label: 'Gas',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.plane,
                        label: 'Airport',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                      MapOption(
                        iconData: FontAwesomeIcons.ship,
                        label: 'Harbour',
                        onTap: addMarkers,
                        lat: destination.lat,
                        lng: destination.lng,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
      elevation: 20,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
    );
  }
}

class SearchFab extends StatelessWidget {
  final Function onTap;

  SearchFab({
    @required this.onTap,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80, right: 20),
      child: FloatingActionButton(
        child: Icon(Icons.search, color: Colors.white),
        backgroundColor: Colors.blueAccent,
        elevation: 10,
        tooltip: 'Search',
        heroTag: 'searchfab',
        onPressed: onTap,
      ),
    );
  }
}
