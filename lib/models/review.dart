import 'package:flutter/foundation.dart';

class Review {
  int id;
  int userId;
  String userImg;
  String userName;
  String content;
  String date;
  int upVotes;
  int downVotes;

  Review(
      {@required this.id,
      @required this.userId,
      @required this.userImg,
      @required this.userName,
      @required this.content,
      @required this.date,
      this.upVotes = 0,
      this.downVotes = 0});
}

List<Review> reviews = [
  Review(
      id: 2,
      userId: 2,
      userImg: 'https://static.tvtropes.org/pmwiki/pub/images/1_258_5.jpg',
      userName: 'Barry Allen',
      content: lorem,
      date: '3-6-2019'),
  Review(
      id: 3,
      userId: 3,
      userImg:
          'https://pmcdeadline2.files.wordpress.com/2018/02/image001-6.jpg?w=425',
      userName: 'scarlet witch',
      content: lorem,
      date: '30-7-209'),
  Review(
      id: 4,
      userId: 4,
      userImg:
          'https://pbs.twimg.com/profile_images/1089306381658787840/Acukp9Yr.jpg',
      userName: 'Clint Barton',
      content: lorem,
      date: '11-5-2018'),
  Review(
      id: 5,
      userId: 5,
      userImg:
          'https://66.media.tumblr.com/037ae99ad855ea4c6c0deff0861e6abb/tumblr_pkgi6t4xnp1xpjiuvo8_250.png',
      userName: 'Scott Lang',
      content: lorem,
      date: '29-7-2019'),
];

const String lorem =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.';
