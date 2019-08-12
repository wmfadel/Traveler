import 'package:flutter/material.dart';
import '../models/activity.dart';

class ActivityItem extends StatelessWidget {
  double screenWidth;
  Orientation orientation;
  final Activity activity;

  ActivityItem(this.activity);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    orientation = MediaQuery.of(context).orientation;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      height: 120,
      child: Material(
        color: Colors.white,
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.hardEdge,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(
                width: orientation==Orientation.landscape?160:120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.check, color: Colors.red, size: 45),
                    Text(
                      activity.name,
                      style: TextStyle(color: Colors.black, fontSize: 23),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: orientation==Orientation.landscape?8:6,
              child: Container(
                width: (screenWidth - ((2*screenWidth*0.05) + 110)),
                child: Image.network(
                  activity.image,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
