import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/strings.dart';
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
    if(ResponsiveSize.width * 100 > 450){
      heightElement = 4;
    }

    return FractionallySizedBox(
      heightFactor: 0.787,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 2 * ResponsiveSize.height),
        decoration: BoxDecoration(
          color: AppTheme.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                left: 4 * ResponsiveSize.height,
                right: 4 * ResponsiveSize.height,
                bottom: 2.5 * ResponsiveSize.height,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 6.5 * ResponsiveSize.height,
                      padding: EdgeInsets.symmetric(horizontal: 2 * ResponsiveSize.height),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1 * ResponsiveSize.height,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.searchHere,
                                ),
                                style: Theme.of(context).textTheme.display2,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.search,
                            size: 3 * ResponsiveSize.height,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 2 * ResponsiveSize.height,
                    right: 1.5 * ResponsiveSize.height,
                  ),
                  child: Container(
                    height: heightElement * ResponsiveSize.height,
                    padding: EdgeInsets.only(
                        left: 2 * ResponsiveSize.height,
                        right: 2 * ResponsiveSize.height,
                        bottom: ResponsiveSize.height,
                        top: ResponsiveSize.height
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(color: AppTheme.topBarBackgroundColor)
                    ),
                    child: Text("Dates", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 2 * ResponsiveSize.height,
                  ),
                  child: Container(
                    height: heightElement * ResponsiveSize.height,
                    padding: EdgeInsets.only(
                        left: 2 * ResponsiveSize.height,
                        right: 2 * ResponsiveSize.height,
                        bottom: ResponsiveSize.height,
                        top: ResponsiveSize.height
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(color: AppTheme.topBarBackgroundColor)
                    ),
                    child: Text("Guests", style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 2.8 * ResponsiveSize.height
              ),
            ),
            Divider(color: Colors.grey[300], thickness: 1, height: 1),
          ],
        ),
      ),
    );
  }
}