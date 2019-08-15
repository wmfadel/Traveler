import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/map_provider.dart';

import 'pages/places_page.dart';
import 'pages/place_details.dart';
import 'pages/place_map.dart';
import 'pages/favorite_places.dart';
import 'pages/visited_places.dart';
import 'pages/watched_page.dart';
import 'pages/reservations_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  final MapProvider mapProvider = MapProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: mapProvider),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
