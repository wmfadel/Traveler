import 'package:flutter/material.dart';
import 'pages/places_page.dart';
import 'pages/place_details.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveler',
      routes: {
        '/': (context) => PlacesPage(),
        PlaceDetails.routeName: (context) => PlaceDetails()
      },
    );
  }
}
