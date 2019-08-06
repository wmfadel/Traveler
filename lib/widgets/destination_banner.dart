import 'dart:ui';
import 'package:flutter/material.dart';
import '../models/destination.dart';

class DestinationBanner extends StatelessWidget {
  double screenWidth;
  double screenHeight;
  final Destination _destination;

  DestinationBanner(this._destination);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;

    return Container(
      width: screenWidth * 0.6,
      height: 120,
      child: Material(
        clipBehavior: Clip.hardEdge,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
        color: Colors.white.withOpacity(0.7),
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
             Text(
                  _destination.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
              Text(
                '${_destination.hotelsCount} hotels available',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 16),
              ),


              Text(
                _destination.imageDescription,
                style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
