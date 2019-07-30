import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/destination_banner.dart';
import '../widgets/custom_fab.dart';

class DestinationItem extends StatelessWidget {
  final Destination _destination;
  double screenWidth;
  double screenHeight;

  DestinationItem(this._destination);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      margin: EdgeInsets.all(10),
      height: 250,
      child: Material(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        elevation: 5,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Hero(
                tag: 'location${_destination.id}',
                child: Image.network(_destination.image, height: 250, fit: BoxFit.cover)),
            Positioned(
              top: 100,
              child: DestinationBanner(_destination),
            ),
            Positioned(
              left: screenWidth * 0.75,
              top: 10,
              child: CustomFab((){
                print('location with id: ${_destination.id} is clicked');
              }),
            ),
          ],
        ),
      ),
    );
  }
}
