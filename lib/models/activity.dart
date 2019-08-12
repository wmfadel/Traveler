import 'package:flutter/material.dart';

class Activity{
  final String name;
  final String image;

  Activity({@required this.name, @required this.image});

}

List<Activity> activities = [
  Activity(name: 'Events', image: 'https://europa.eu/youth/sites/default/files/article/sziget-line-up.jpg'),
  Activity(name: 'Activity', image: 'https://img.grouponcdn.com/deal/5x1d3C8CG9xbRS6xcLoGBq/skydive_alabama-960x576/v1/c700x420.jpg'),
  Activity(name: 'Food', image: 'https://chinesenewyear.imgix.net/assets/images/food/chinese-new-year-food-feast.jpg?q=50&w=1600&h=900&fit=crop&auto=format'),
  Activity(name: 'Shopping', image: 'https://thevoga.com/wp-content/uploads/2019/04/black-friday-shopping-at-the-mall_1542817198181_421713_ver1.0_62844402_ver1.0_1280_720.jpg'),
  Activity(name: 'Sights', image: 'https://rangerrick.org/wp-content/uploads/2018/04/April-2014-RainyAnimals.jpg')
];