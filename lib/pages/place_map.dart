import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/destination.dart';
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

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    args.containsKey('id') ? placeId = args['id'] : print('no key found');
    destination = destinations.firstWhere((dest) {
      return dest.id == placeId;
    });
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
                      MapOption(iconData: Icons.hotel, label: 'Hotels'),
                      MapOption(iconData: Icons.restaurant, label: 'Food'),
                      MapOption(
                          iconData: FontAwesomeIcons.wineGlass, label: 'Bar'),
                      MapOption(
                          iconData: FontAwesomeIcons.coffee, label: 'Caffe'),
                      MapOption(
                          iconData: FontAwesomeIcons.hospital,
                          label: 'Hospital'),
                      MapOption(
                          iconData: FontAwesomeIcons.balanceScale,
                          label: 'Police'),
                      MapOption(
                          iconData: FontAwesomeIcons.school, label: 'Schools'),
                      MapOption(
                          iconData: FontAwesomeIcons.university,
                          label: 'Univiristy'),
                      MapOption(
                          iconData: FontAwesomeIcons.clinicMedical,
                          label: 'Clinics'),
                      MapOption(
                          iconData: FontAwesomeIcons.tree, label: 'Forests'),
                      MapOption(
                          iconData: FontAwesomeIcons.book, label: 'Library'),
                      MapOption(
                          iconData: FontAwesomeIcons.building, label: 'Garage'),
                      MapOption(
                          iconData: FontAwesomeIcons.landmark,
                          label: 'Monument'),
                      MapOption(
                          iconData: FontAwesomeIcons.gasPump, label: 'Gas'),
                      MapOption(
                          iconData: FontAwesomeIcons.plane, label: 'Airport'),
                      MapOption(
                          iconData: FontAwesomeIcons.ship, label: 'Harbour'),
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
      padding: const EdgeInsets.only(bottom: 25, right: 16),
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
