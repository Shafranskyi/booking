import 'slider/slider.dart';
import 'items/typeItem.dart';
import 'items/sortItem.dart';
import 'items/partItem.dart';

import 'topContainer/portrait/topContainerPortrait.dart';
import 'topContainer/landscape/topContainerLandscape.dart';

import 'package:booking/models/viewModel.dart';
import 'package:booking/state/appState.dart';
import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/responsiveWidget.dart';
import 'package:booking/setting/styling.dart';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SearchScreen extends StatefulWidget{
  const SearchScreen({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    ResponsiveSize().init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel viewModel) {
            return SafeArea(
              bottom: false,
              left: true,
              right: true,
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      constraints: BoxConstraints(maxHeight: 40 * (MediaQuery.of(context).orientation == Orientation.portrait ? ResponsiveSize.height : ResponsiveSize.width)),
                      child: Stack(
                        children: <Widget>[
                          ResponsiveWidget(
                            portraitLayout: TopContainerPortrait(),
                            landscapeLayout: TopContainerLandscape(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints(maxHeight: 88 * ResponsiveSize.height),
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    PartItem(title: 'SORT'),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.7 * ResponsiveSize.height
                                      ),
                                    ),
                                    Container(
                                      height: 5 * ResponsiveSize.height,
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.only(left: 3 * ResponsiveSize.width),
                                                  child: SortItem(title: "Dates"),
                                                ),
                                                SortItem(title: "Recommended"),
                                                SortItem(title: "Price"),
                                                SortItem(title: "Ratings"),
                                                SortItem(title: "Recently Added"),
                                              ]
                                          )
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 4.7 * ResponsiveSize.height
                                      ),
                                    ),
                                    PartItem(title: 'PRICE RANGE'),
                                    RangeSliderItem(
                                      initialMinValue: 1,
                                      initialMaxValue: 50000,
                                      onMinValueChanged: (v){},
                                      onMaxValueChanged: (v){},
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 2.8 * ResponsiveSize.height
                                      ),
                                    ),
                                    PartItem(title: 'TYPES'),
                                    Container(
                                      padding: EdgeInsets.only(top: 4.5 * ResponsiveSize.height),
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                TypeItem(title: 'Hotels'),
                                                TypeItem(title: 'Hostels')
                                              ]
                                          )
                                      ),
                                    )
                                  ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}





