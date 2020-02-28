import 'package:flutter/material.dart';

import 'package:booking/pages/homeScreen/starRating/starRating.dart';
import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/styling.dart';
import 'imageSection/imageSection.dart';

class HomeItem extends StatefulWidget{
  final String imagePath, name, price;
  final double rating;
  final bool recommended;

  HomeItem({Key key,
    @required this.rating,
    @required this.imagePath,
    @required this.name,
    @required this.price,
    @required this.recommended
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeItemState(rating: rating);

  HomeItem copyWith({double rating, String imagePath, String name, String price, String recommended}) {
    return HomeItem(
      rating: rating ?? this.rating,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
      recommended: recommended ?? this.recommended,
      name: name ?? this.name,
    );
  }

  HomeItem.fromJson(Map json)
      : rating = json['rating'],
        imagePath = json['imagePath'],
        name = json['name'],
        price = json['price'],
        recommended = json['recommended'];

  Map toJson() => {
    'imagePath' : imagePath,
    'name' : name,
    'price' : price,
    'recommended' : recommended,
    'rating' : rating
  };
}

class HomeItemState extends State<HomeItem> {
  double rating = 0.0;
  String price = "";
  bool like = false;
  TextOverflow overflow;

  HomeItemState({this.rating});

  @override
  Widget build(BuildContext context) {
    price = widget.price;

    if(widget.name.length > 20)
      overflow = TextOverflow.ellipsis;
    else
      overflow = TextOverflow.fade;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3 * ResponsiveSize.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ImageSection(
            imagePath: widget.imagePath,
            recommended: widget.recommended,
            like: like,
            changedLike: (changedLike){
              setState(() {
                like = changedLike;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(2.0 * ResponsiveSize.width),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StarRating(
                  rating: rating,
                  color: AppTheme.selectedTabBackgroundColor,
                  onRatingChanged: (rating) => setState(() => this.rating = rating),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0 * ResponsiveSize.height),
                  child: SizedBox(
                    width: 33 * ResponsiveSize.width,
                    child: Text(
                      widget.name,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                      softWrap: true,
                      overflow: overflow,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.0 * ResponsiveSize.height),
                  child: Text(
                    "\$$price",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}