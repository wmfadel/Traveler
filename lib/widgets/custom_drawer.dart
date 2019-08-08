import 'package:flutter/material.dart';
import 'drawer_button.dart';

// pages imports
import '../pages/places_page.dart';

class CustomDrawer extends StatelessWidget {
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
              DrawerButton(text: 'Profile', onTap: () {}),
              DrawerButton(
                  text: 'Best Places',
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(PlacesPage.routeName);
                  }),
              DrawerButton(text: 'My Reservations', onTap: () {}),
              DrawerButton(text: 'Visited Places', onTap: () {}),
              DrawerButton(text: 'Favorite Places', onTap: () {}),
              DrawerButton(text: 'Last Watched', onTap: () {}),
              DrawerButton(text: 'Privacy Policy', onTap: () {}),
              DrawerButton(text: 'Support & FAQs', onTap: () {}),
              DrawerButton(text: 'Settings', onTap: () {}),
              DrawerButton(text: 'Logout', onTap: () {}),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
