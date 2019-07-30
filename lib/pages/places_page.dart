import 'package:flutter/material.dart';

import '../models/destination.dart';
import '../widgets/destination_item.dart';

class PlacesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Best places', style:TextStyle(color: Colors.black )),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index){
          return DestinationItem(destinations[index]);
        },
      ),
    );
  }
}
