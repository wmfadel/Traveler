import 'package:flutter/material.dart';
import 'pages/places_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveler',
      routes: {
        '/': (context) => PlacesPage(),
      },
    );
  }
}
