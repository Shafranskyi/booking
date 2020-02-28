import 'leftSection/leftSection.dart';
import 'rightSection/rightSection.dart';

import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/styling.dart';

import 'package:flutter/material.dart';

class MyBookingItem extends StatefulWidget {
  final String imagePath, name, lastTime, lastMessage, location;

  MyBookingItem({Key key,
    @required this.lastTime,
    @required this.imagePath,
    @required this.lastMessage,
    @required this.location,
    @required this.name,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyBookingItemState();

  MyBookingItem copyWith(
      {String lastTime, String imagePath, String location, String lastMessage}) {
    return MyBookingItem(
      lastTime: lastTime ?? this.lastTime,
      imagePath: imagePath ?? this.imagePath,
      location: location ?? this.location,
      lastMessage: lastMessage ?? this.lastMessage,
      name: name ?? this.name,
    );
  }

  MyBookingItem.fromJson(Map json)
      : lastTime = json['lastTime'],
        imagePath = json['imagePath'],
        location = json['location'],
        lastMessage = json['lastMessage'],
        name = json['name'];

  Map toJson() => {
    'lastTime' : lastTime,
    'imagePath' : imagePath,
    'location' : location,
    'lastMessage' : lastMessage,
    'name' : name,
  };
}

class MyBookingItemState extends State<MyBookingItem> {
  MyBookingItemState({Key key});

  @override
  Widget build(BuildContext context) {

    double widthItem = 100 * ResponsiveSize.width;
    double widthNameAndLocationContainers = 50.0 * ResponsiveSize.width;
    double widthCheckContainers = 35 * ResponsiveSize.width;

    if(MediaQuery.of(context).orientation == Orientation.landscape) {
      widthItem = 100 * ResponsiveSize.height;
      widthNameAndLocationContainers = 70 * ResponsiveSize.height;
      widthCheckContainers = 36 * ResponsiveSize.height;
    }

    return Container(
      height: 28 * ResponsiveSize.height,
      width: widthItem,
      color: AppTheme.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LeftSection(
            imagePath: widget.imagePath,
          ),
          RightSection(
              name: widget.name,
              widthCheckContainers: widthCheckContainers,
              widthNameAndLocationContainers: widthNameAndLocationContainers,
              location: widget.location
          )
        ],
      ),
    );
  }
}
























