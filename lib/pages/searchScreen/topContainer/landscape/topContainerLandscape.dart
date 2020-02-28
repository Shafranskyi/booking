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
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.38,
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
                    child: Container(
                      padding: EdgeInsets.only(top: 1.5 * ResponsiveSize.height),
                      child: Text('Options', style: TextStyle(fontSize: 17)),
                    )
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.only(right: 3 * ResponsiveSize.width, top: 1.5 * ResponsiveSize.height),
                  child: Text('Reset', style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.normal)),
                ),
                Container(
                  height: 3 * ResponsiveSize.height,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 1.5 * ResponsiveSize.width),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: (){

                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}