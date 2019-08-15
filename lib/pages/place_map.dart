import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/map_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/destination.dart';
import '../models/map_place.dart';
import '../widgets/map_option.dart';
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
    mapProvider.places.forEach((MapPlace mapPlace) {
      markers.add(Marker(
        markerId: MarkerId(mapPlace.id),
        position: LatLng(mapPlace.lat, mapPlace.lng),
        infoWindow: InfoWindow(
            title:
                '${mapPlace.name} - rate: ${mapPlace.rating != null ? mapPlace.rating : 'bot rated'}',
            snippet: mapPlace.vicinity),
      ));
    });
    print('places count ${mapProvider.places.length}');
    print('markers count ${markers.length}');
    setState(() {});
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    );
  }
}

class SearchFab extends StatelessWidget {
  Function onTap;

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
