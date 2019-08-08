import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  final String text;
  final Function onTap;


  DrawerButton({@required this.text, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.greenAccent,
      borderRadius: BorderRadius.circular(10),
      child:  Container(
        padding: EdgeInsets.all(8),
        child: Text(text, style: TextStyle(color: Colors.black, fontSize: 18),),
      ),
    );
  }
}
