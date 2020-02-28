import '../../bubbleTabIndicator/bubbleTabIndicator.dart';

import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/styling.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopContainerLandscape extends StatefulWidget{
  const TopContainerLandscape({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TopContainerLandscapeState();
}

class TopContainerLandscapeState extends State<TopContainerLandscape> {
  double heightElement = 5.0;

  @override
  Widget build(BuildContext context) {
    double radius = 25;

    if(ResponsiveSize.phoneLand){
      radius = 25;
    }
    if(ResponsiveSize.tabLand){
      radius = 35;
    }

    return FractionallySizedBox(
      heightFactor: 0.807,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 1.5 * ResponsiveSize.height),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                    child: Text('My Bookings', style: TextStyle(fontSize: 17))
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2.5 * ResponsiveSize.height
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
            Container(
              padding: EdgeInsets.only(
                top: 2.6 * ResponsiveSize.height,
                left: 4 * ResponsiveSize.height,
                right: 4 * ResponsiveSize.height,
                bottom: 2.6 * ResponsiveSize.height,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 7 * ResponsiveSize.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(radius),
                        ),
                        border: Border.all(color: Colors.grey[300]),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BubbleTab(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
          ],
        ),
      ),
    );
  }
}