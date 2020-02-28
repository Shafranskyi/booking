import 'package:booking/setting/responsiveSize.dart';
import 'package:flutter/cupertino.dart';

class LeftSection extends StatelessWidget {
  final imagePath;

  const LeftSection({ Key key, this.imagePath }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Expanded(
            flex: 8,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 12 * ResponsiveSize.height, right: 3 * ResponsiveSize.width, top: 3.3 * ResponsiveSize.height, left: 3.5 * ResponsiveSize.width),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(3 * ResponsiveSize.height),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}