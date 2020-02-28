import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/styling.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSection extends StatefulWidget {
  final ValueChanged<bool> changedLike;
  final String imagePath;
  final bool recommended, like;

  ImageSection({
    Key key,
    this.imagePath,
    this.recommended,
    this.like,
    this.changedLike
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => ImageSectionState();
}
class ImageSectionState extends State<ImageSection> {

  bool pressFavorite(bool key) {
    return !key;
  }

  @override
  Widget build(BuildContext context) {
    bool like = widget.like;

    return Expanded(
      flex: 8,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(3 * ResponsiveSize.height),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  right:0.0,
                  top: 0.0,
                  child: new IconButton(
                    icon: new Icon(Icons.favorite, color:  like ? Colors.red : null),
                    onPressed: null,
                  ),
                ),
                Positioned(
                  right:0.0,
                  top: 0.0,
                  child: new IconButton(
                      icon: new Icon(Icons.favorite_border, color: like ? Colors.red : Colors.white),
                      onPressed: () {
                        setState(() {
                          like = pressFavorite(like);
                          widget.changedLike(like);
                        });
                      }
                  ),
                ),
                Visibility(
                  visible: widget.recommended,
                  child: Positioned(
                    left: 9.0,
                    bottom: 7.0,
                    right: 9.0,
                    child: Container(
                      height: 3.5 * ResponsiveSize.height,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.all(
                          Radius.circular(3.0 * ResponsiveSize.height),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(Icons.check_circle, color: Colors.green, size: 16),
                          Text("RECOMMENDED", style: TextStyle(fontSize: 11, color: AppTheme.white))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}