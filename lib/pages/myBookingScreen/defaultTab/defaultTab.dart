import 'package:flutter/material.dart';
import 'package:booking/setting/responsiveSize.dart';

class DefaultTab extends StatefulWidget{
  final String title;
  const DefaultTab({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => DefaultTabState(this.title);
}

class DefaultTabState extends State<DefaultTab>{
  final String title;

  DefaultTabState(this.title);

  @override
  Widget build(BuildContext context) {
    double width;

    if(ResponsiveSize.phonePort){
      width = 22.0;
    }
    else if(ResponsiveSize.phoneLand){
      width = 42.5;
    }
    else if(ResponsiveSize.tabPort){
      width = 24.3;
    }
    else if(ResponsiveSize.tabLand){
      width = 47.0;
    }

    return Container(
      child: Align(
        child: Text(
            title,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.normal
            )
        ),
        alignment: Alignment.center,
      ),
      height: 5 * ResponsiveSize.height,
      width: width * ResponsiveSize.width,
    );
  }
}