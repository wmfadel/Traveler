import 'package:flutter/material.dart';
import 'package:polygon_clipper/polygon_clipper.dart';

class MapOption extends StatelessWidget {
  IconData iconData;
  String label;

  MapOption({@required this.iconData, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: ClipPolygon(
        sides: 6,
        borderRadius: 10,
        // Default 0.0 degrees
        rotate: 60.0,
        // Default 0.0 degrees
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
                Icon(iconData, color: Colors.white,),
                SizedBox(height: 4),
                Text(label, style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
