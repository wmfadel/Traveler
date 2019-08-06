import 'dart:ui';
import 'package:flutter/material.dart';

class CustomFab extends StatefulWidget {
  final Function onTap;

  CustomFab(this.onTap);

  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blueAccent,
      onTap: widget.onTap,
      child: Container(
        width: 90,
        height: 40,
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: Colors.white.withOpacity(0.7),
        ),
        child: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Text('5654'),
          Icon(Icons.favorite_border, color: Colors.blueAccent,)
        ],)),
      ),
    );
  }
}
