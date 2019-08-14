import 'dart:io';


import 'package:flutter/material.dart';
import 'drawer_button.dart';
import '../enums/drawer_pages.dart';

// pages imports
import '../pages/places_page.dart';
import '../pages/favorite_places.dart';
import '../pages/visited_places.dart';
import '../pages/watched_page.dart';
import '../pages/reservations_page.dart';

class CustomDrawer extends StatelessWidget {
  static DrawerPages drawerPages = DrawerPages.bestPlaces;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1089306381658787840/Acukp9Yr.jpg'),
              ),
              SizedBox(height: 20),
              DrawerButton(
                text: 'Profile',
                onTap: () {},
                isActive: drawerPages == DrawerPages.profile,
              ),
              DrawerButton(
                text: 'Best Places',
                onTap: () {
                  drawerPages = DrawerPages.bestPlaces;
                  Navigator.of(context)
                      .pushReplacementNamed(PlacesPage.routeName);
                },
                isActive: drawerPages == DrawerPages.bestPlaces,
              ),
              DrawerButton(
                text: 'My Reservations',
                onTap: () {
                  drawerPages = DrawerPages.reservations;
                  Navigator.of(context)
                      .pushReplacementNamed(ReservationsPage.routeName);
                },
                isActive: drawerPages == DrawerPages.reservations,
              ),
              DrawerButton(
                text: 'Visited Places',
                onTap: () {
                  drawerPages = DrawerPages.visitedPlaces;
                  Navigator.of(context)
                      .pushReplacementNamed(VisitedPlaces.routeName);
                },
                isActive: drawerPages == DrawerPages.visitedPlaces,
              ),
              DrawerButton(
                text: 'Favorite Places',
                onTap: () {
                  drawerPages = DrawerPages.favoritePlaces;
                  Navigator.of(context)
                      .pushReplacementNamed(FavoritePlaces.routeName);
                },
                isActive: drawerPages == DrawerPages.favoritePlaces,
              ),
              DrawerButton(
                text: 'Last Watched',
                onTap: () {
                  drawerPages = DrawerPages.lastWatched;
                  Navigator.of(context)
                      .pushReplacementNamed(WatchedPlaces.routeName);
                },
                isActive: drawerPages == DrawerPages.lastWatched,
              ),
              DrawerButton(
                text: 'Privacy Policy',
                onTap: () {},
                isActive: drawerPages == DrawerPages.privacy,
              ),
              DrawerButton(
                text: 'Support & FAQs',
                onTap: () {},
                isActive: drawerPages == DrawerPages.faq,
              ),
              DrawerButton(
                text: 'Settings',
                onTap: () {},
                isActive: drawerPages == DrawerPages.settings,
              ),
              DrawerButton(
                  text: 'Logout',
                  onTap: () {
                    // this is a wrong practice but its just a place holder for now
                    // in future IF i completed this app there will be a login page or something to navigate to
                    // and leave this close app -thingy- to be handled by the operating system
                    exit(0);
                  }),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
