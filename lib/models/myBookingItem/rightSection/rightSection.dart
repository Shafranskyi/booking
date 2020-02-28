import 'package:booking/setting/responsiveSize.dart';
import '../../../pages/myBookingScreen/modalWindow/modalWindow.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RightSection extends StatelessWidget {
  RightSection({ Key key, this.widthNameAndLocationContainers, this.widthCheckContainers, this.name, this.location }) : super(key: key);
  final Modal modal = new Modal();

  final double widthNameAndLocationContainers;
  final double widthCheckContainers;
  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 1 * ResponsiveSize.width, top: 3.5 * ResponsiveSize.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 8 * ResponsiveSize.height,
                  width: widthNameAndLocationContainers,
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  width: 20 * ResponsiveSize.width,
                  height: 8 * ResponsiveSize.height,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () => modal.mainBottomSheet(context),
                  ),
                )
              ],
            ),
            Container(
              height: 7 * ResponsiveSize.height,
              width: widthNameAndLocationContainers,
              child: Text(
                  location,
                  style: TextStyle(color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal
                  )
              ),
            ),
            Container(
                height: 7 * ResponsiveSize.height,
                width: widthCheckContainers * 2.0,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: widthCheckContainers,
                        height: 7 * ResponsiveSize.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Check-in:',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  '22 September, Sat',
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        )
                    ),
                    Container(
                      width: widthCheckContainers,
                      height: 7 * ResponsiveSize.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Check-out:',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '16 September, Mon',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}