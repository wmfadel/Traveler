import 'package:flutter/material.dart';
import 'pages/places_page.dart';
import 'pages/place_details.dart';
import 'pages/place_map.dart';
import 'pages/favorite_places.dart';
import 'pages/visited_places.dart';
import 'pages/watched_page.dart';
import 'pages/reservations_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Traveler',
      routes: {
        PlacesPage.routeName: (context) => PlacesPage(),
        FavoritePlaces.routeName: (context) => FavoritePlaces(),
        VisitedPlaces.routeName: (context) => VisitedPlaces(),
        WatchedPlaces.routeName: (context) => WatchedPlaces(),
        ReservationsPage.routeName: (context) => ReservationsPage(),
        PlaceDetails.routeName: (context) => PlaceDetails(),
        PlaceMap.routeName: (context) => PlaceMap(),
      },
    );
  }
}
