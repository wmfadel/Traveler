import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/map_provider.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class MapOption extends StatelessWidget {
  IconData iconData;
  String label;
  Function onTap;
  double lat, lng;
  MapProvider mapProvider;

  MapOption(
      {@required this.iconData,
      @required this.label,
      @required this.onTap,
      @required this.lat,
      @required this.lng});

  @override
  Widget build(BuildContext context) {
    mapProvider = Provider.of<MapProvider>(context, listen: false);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        mapProvider.findLocations(label.toLowerCase(), lat, lng).then((_){
          onTap();
        });
      },
      child: Container(
        width: 100,
        height: 100,
        child: ClipPolygon(
          sides: 6,
          borderRadius: 10,
          rotate: 60.0,
          boxShadows: [
            PolygonBoxShadow(color: Colors.black, elevation: 1.0),
            PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
          ],
          child: Container(
            color: Colors.blueAccent,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    iconData,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4),
                  Text(
                    label,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
