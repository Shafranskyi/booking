import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/styling.dart';

import 'package:flutter/material.dart';

class FilterItemHolder extends StatelessWidget {
  final String value;
  final Widget child;

  FilterItemHolder({Key key, this.value = '', this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 4.5 * ResponsiveSize.height),
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 3 * ResponsiveSize.width),
                child: Text(value, style: TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 1.5 * ResponsiveSize.height, left: 3 * ResponsiveSize.width, right: 3 * ResponsiveSize.width),
          decoration: BoxDecoration(
            color: AppTheme.white,
          ),
          child: Container(
            height: 7 * ResponsiveSize.height,
            child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child: child,
            ),
          ),
        )
      ],
    );
  }
}