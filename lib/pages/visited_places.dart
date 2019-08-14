import 'package:flutter/material.dart';

import '../models/destination.dart';
import '../widgets/destination_item.dart';
import '../widgets/custom_drawer.dart';

class VisitedPlaces extends StatefulWidget {
  static const String routeName = '/visited-page';

  @override
  _VisitedPlacesState createState() => _VisitedPlacesState();
}

class _VisitedPlacesState extends State<VisitedPlaces>
    with SingleTickerProviderStateMixin {
  double screenWidth;
  double screenHeight;
  bool isCollapsed = true;
  final Duration duration = Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.2, end: 1.0).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          buildDrawer(),
          buildBodyColumn(context),
        ],
      ),
    );
  }

  Widget buildDrawer() {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: CustomDrawer(),
      ),
    );
  }

  Widget buildBodyColumn(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.4 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          elevation: 10,
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (!isCollapsed) {
                      _controller.reverse();
                      isCollapsed = true;
                    }
                  });
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isCollapsed
                                  ? _controller.forward()
                                  : _controller.reverse();
                              isCollapsed = !isCollapsed;
                            });
                          }),
                      Text('Visited Places', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 40),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 80,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: visitedDestinations.length,
                  itemBuilder: (context, index) {
                    return DestinationItem(visitedDestinations[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
