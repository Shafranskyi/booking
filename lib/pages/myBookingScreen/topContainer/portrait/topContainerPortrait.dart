import '../../bubbleTabIndicator/bubbleTabIndicator.dart';

import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/styling.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopContainerPortrait extends StatefulWidget{
  const TopContainerPortrait({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => TopContainerPortraitState();
}

class TopContainerPortraitState extends State<TopContainerPortrait> {

  @override
  Widget build(BuildContext context) {
    double radius = 25;

    if(ResponsiveSize.phonePort){
      radius = 25;
    }
    if(ResponsiveSize.tabPort){
      radius = 35;
    }

    return FractionallySizedBox(
      heightFactor: 0.558,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 3.0 * ResponsiveSize.height),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                top: 3.6 * ResponsiveSize.height,
                left: 3 * ResponsiveSize.height,
                right: 3 * ResponsiveSize.height,
                bottom: 3 * ResponsiveSize.height,
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
                          border: Border.all(color: Colors.grey[300])
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