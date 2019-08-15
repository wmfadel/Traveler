import 'package:flutter/foundation.dart';

class MapPlace {
  double lat;
  double lng;
  String id;
  String name;
  String vicinity;
  bool open_now;
  String photo_reference;
  String place_id;
  double rating;
  List<String> types;

  MapPlace(
    this.lat,
    this.lng,
    this.id,
    this.name,
    this.vicinity,
    this.open_now,
    this.photo_reference,
    this.place_id,
    this.rating,
    this.types,
  );

  MapPlace.fromJson(Map<String, dynamic> json) :
        this.lat = json['geometry']['location']['lat'],
        this.lng = json['geometry']['location']['lng'],
        this.id = json['id'],
        this.name = json['name'],
        this.vicinity = json['vicinity'],
        this.open_now = json['opening_hours']['open_now'],
        this.photo_reference = json['photo_reference']['photo_reference'],
        this.place_id = json['place_id'],
        this.rating = json['rating'],
        this.types = json['types'];
}

/*
example object json response
{
         "geometry" : {
            "location" : {
               "lat" : 30.0432372,
               "lng" : 31.2321682
            },
            "viewport" : {
               "northeast" : {
                  "lat" : 30.0446551302915,
                  "lng" : 31.23364838029151
               },
               "southwest" : {
                  "lat" : 30.0419571697085,
                  "lng" : 31.23095041970851
               }
            }
         },
         "icon" : "https://maps.gstatic.com/mapfiles/place_api/icons/restaurant-71.png",
         "id" : "a733a7745e445622e16990f7bb98ce5ad723ee82",
         "name" : "Sushiramis",
         "opening_hours" : {
            "open_now" : false
         },
         "photos" : [
            {
               "height" : 2456,
               "html_attributions" : [
                  "\u003ca href=\"https://maps.google.com/maps/contrib/100468114371397482867/photos\"\u003eInterContinental Cairo Semiramis Hotel\u003c/a\u003e"
               ],
               "photo_reference" : "CmRaAAAA1PitBRZik3SHOnKRgaHtPOmh8i_xFh-MyC3Ls9NTeMc2H_dljJCGmNilHOPfSng40dULeP_Zr3eWMiJxTTyD6w26gA-qlfnOKng8Dx6XJzwNq1yx-gfeEjIQEMElJYyEEhA5X3u9oKL4W2dQku4J17hmGhQh_KPoOeF1mE3rAoFZ7HbaPVbuZQ",
               "width" : 3680
            }
         ],
         "place_id" : "ChIJq6qq2sxAWBQRCGxYPIC1ShQ",
         "plus_code" : {
            "compound_code" : "26VJ+7V Cairo, Egypt",
            "global_code" : "8G2H26VJ+7V"
         },
         "rating" : 4.4,
         "reference" : "ChIJq6qq2sxAWBQRCGxYPIC1ShQ",
         "scope" : "GOOGLE",
         "types" : [ "restaurant", "food", "point_of_interest", "establishment" ],
         "user_ratings_total" : 13,
         "vicinity" : "8 Al Haras, Qasr El Nil"
      },
 */

// image url
// https://maps.googleapis.com/maps/api/place/photo?photoreference=CmRaAAAA8cII5axFe4TbrB9iy9ZX7hO8eyIDIW_WGhQTjzeHMxx7cpKawaRT2P6xs2h_Cn6IDJ00BkTk5lINoUPlpivegDu3vxE-TOpog59K2kYqFlGd3ZhvKXjcMQmemFvrGOGlEhAihjZiDDodLl9RpyG-WFwjGhRJ53xLn_Kv_nu0m9quUBn8R6Q-gg&maxheight=400&maxwidth=800&key=00000000000000000000000000
