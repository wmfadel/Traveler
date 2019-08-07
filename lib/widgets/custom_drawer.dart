import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1089306381658787840/Acukp9Yr.jpg'),
            ),
            SizedBox(height: 20),
            Text("Dashboard",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(height: 10),
            Text("Messages",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(height: 10),
            Text("Utility Bills",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(height: 10),
            Text("Funds Transfer",
                style: TextStyle(color: Colors.black, fontSize: 18)),
            SizedBox(height: 10),
            Text("Branches",
                style: TextStyle(color: Colors.black, fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
