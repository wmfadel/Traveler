import 'package:flutter/material.dart';

class InfoChip extends StatelessWidget {
  final String text;
  final String value;
  Color color;

  InfoChip(this.text, this.value, {this.color = const Color(0xffBF360C)});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 8),
          Container(
            child: Text('$value', style: TextStyle(color: Colors.black)),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25)),
    );
  }
}