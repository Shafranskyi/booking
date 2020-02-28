import 'package:flutter/material.dart';

import 'package:booking/setting/responsiveSize.dart';
import '../defaultCheckBox/defaultCheckBox.dart';

class TypeItem extends StatelessWidget {
  final String title;

  TypeItem({Key key, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 3 * ResponsiveSize.height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 5 * ResponsiveSize.width),
            child: Text(title, style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5 * ResponsiveSize.width),
            child: MyCheckBox(),
          ),
        ],
      ),
    );
  }
}