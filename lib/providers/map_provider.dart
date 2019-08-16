import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../models/map_place.dart';

class MapProvider extends ChangeNotifier {
  List<MapPlace> _places = [];

  List<MapPlace> get places => List<MapPlace>.from(_places);

  Future<bool> findLocations(String keyWord, double lat, double lng) async {
    String url = '$base$key&location=$lat,$lng&$radius&type=$keyWord&$fields';
    print(url);
    http.Response response = await http.get(url).catchError((err) {
      print('big error happend: ${err.toString()}');
    });
    Map<String, dynamic> res = json.decode(response.body);
    List<MapPlace> newPlaces = [];
    for (var i in res['results']) {
      newPlaces.add(MapPlace.fromJson(i));
    }
    _places = newPlaces;
    print('API places count ${_places.length}');
    return true;
  }
}

const String fields =
    'fields=photos,formatted_address,name,rating,opening_hours,geometry';
const String radius = 'radius=5000';
const String key = 'key=AIzaSyAWdJUdZD75aDBqMMAT3RITwbjqMAs5WVw';
const String base =
    'https://maps.googleapis.com/maps/api/place/nearbysearch/json?';

/*
https://maps.googleapis.com/maps/api/place/nearbysearch/json?
key=AIzaSyAWdJUdZD75aDBqMMAT3RITwbjqMAs5WVw
&location=30.0423942,31.2323014
&radius=1500&type=restaurant
&fields=photos,formatted_address,name,rating,opening_hours,geometry
 */
