import 'package:flutter/material.dart';
import '../models/review.dart';

class ReviewItem extends StatefulWidget {
  final Review _review;

  ReviewItem(this._review);

  @override
  _ReviewItemState createState() => _ReviewItemState();
}

class _ReviewItemState extends State<ReviewItem> {
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget._review.userImg)),
                borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(width: 10),
          Container(
            width: screenWidth - 90,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildNameDateColumn(),
                    Align(
                      alignment: Alignment.topRight,
                      child: buildVotesRow(),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(widget._review.content),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildVotesRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          widget._review.upVotes.toString(),
          style: TextStyle(color: Colors.green, fontSize: 20),
        ),
        Icon(Icons.keyboard_arrow_up, color: Colors.green, size: 30),
        SizedBox(width: 10),
        Text(
          widget._review.downVotes.toString(),
          style: TextStyle(color: Colors.red, fontSize: 20),
        ),
        Icon(Icons.keyboard_arrow_down, color: Colors.red, size: 30),
      ],
    );
  }

  Column buildNameDateColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget._review.userName,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 4),
        Text(
          'at: ${widget._review.date}',
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
