import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import '../widgets/custom_drawer.dart';
import 'package:flutter/gestures.dart';
import 'places_page.dart';
import '../enums/drawer_pages.dart';

class ReservationsPage extends StatefulWidget {
  static const String routeName = '/reservations-page';

  @override
  _ReservationsPageState createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage>
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
                      Text('My Reservations', style: TextStyle(fontSize: 18)),
                      SizedBox(width: 40),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height - 80,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: new TextSpan(
                          text:
                              'It seems that you don\'t have plans for the near future\nluckely you can add some ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'now.',
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    CustomDrawer.drawerPages =
                                        DrawerPages.bestPlaces;
                                    Navigator.of(context).pushReplacementNamed(
                                        PlacesPage.routeName);
                                  }),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: screenWidth,
                      height: 400,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: FlareActor("assets/flare/tedd.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.contain,
                          animation: "idle"),
                    ),
                  ],
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
