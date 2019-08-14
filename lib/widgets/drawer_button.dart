import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String text;
  final Function onTap;
  bool isActive;

  DrawerButton(
      {@required this.text, @required this.onTap, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 8, 215, 8),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(width: 8),
                Text(
                  text,
                  style: TextStyle(
                      color: isActive ? Colors.blueAccent : Colors.black,
                      fontWeight: isActive?FontWeight.bold:FontWeight.normal,
                      fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
