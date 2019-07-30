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
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.7),
        ),
        child: Center(child: Icon(Icons.favorite_border)),
      ),
    );
  }
}
