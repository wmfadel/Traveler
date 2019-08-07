import 'package:flutter/material.dart';
import '../models/destination.dart';
import '../widgets/custom_fab.dart';

import '../models/review.dart';
import '../widgets/review_item.dart';
import 'place_map.dart';

class PlaceDetails extends StatefulWidget {
  static const String routeName = '/place-details';

  @override
  _PlaceDetailsState createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  int placeId;
  Destination destination;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    args.containsKey('id') ? placeId = args['id'] : print('no key found');
    destination = destinations.firstWhere((dest) {
      return dest.id == placeId;
    });
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        buildSliverAppBar(),
        buildSliverFillRemainingBody(),
      ],
    ));
  }

  Widget buildSliverFillRemainingBody() {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              destination.imageDescription,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              lorem,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 50),
            Text(
              'Reviews',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              physics: ClampingScrollPhysics(),
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                return ReviewItem(reviews[index]);
              },
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      centerTitle: true,
      expandedHeight: 320,
      elevation: 0,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            Hero(
                tag: 'location${destination.id}',
                child: Image.network(
                  destination.image,
                  height:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 350
                          : 700,
                  fit: BoxFit.fill,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: CustomFab(() {}),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: MaterialButton(
                    color: Colors.green,
                    child: Text(
                      'View on map',
                      style: TextStyle(color: Colors.white),
                    ),
                    padding: EdgeInsets.all(8),
                    height: 28,
                    onPressed: () {
                      Navigator.of(context).pushNamed(PlaceMap.routeName,
                          arguments: {'id': destination.id});
                    }),
              ),
            ),
          ],
        ),
      ),
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.black45.withOpacity(0.3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          destination.name,
          style: TextStyle(
              color: Colors.white,
              shadows: [Shadow(color: Colors.white, blurRadius: 8)]),
        ),
      ),
    );
  }
}

const String lorem =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

/*
Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 10),
            Text(
              destination.imageDescription,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              lorem,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      );
 */
