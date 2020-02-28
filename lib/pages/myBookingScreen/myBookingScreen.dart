import '../../models/myBookingItem/myBookingItem.dart';

import 'topContainer/landscape/topContainerLandscape.dart';
import 'topContainer/portrait/topContainerPortrait.dart';

import 'package:booking/models/viewModel.dart';
import 'package:booking/state/appState.dart';

import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/responsiveWidget.dart';
import 'package:booking/setting/styling.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';


class MyBookingScreen extends StatefulWidget{
  const MyBookingScreen({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyBookingScreenState();
}

class MyBookingScreenState extends State<MyBookingScreen> {
  List<Widget> _buildList(List<MyBookingItem> list) {
    List<Widget> items = []; // this will hold Rows according to available lines
    for (var line in list.toList()) {
      items.add(MyBookingItem(
        imagePath: line.imagePath,
        lastMessage: line.lastMessage,
        lastTime: line.lastTime,
        location: line.location,
        name: line.name,
      ));
      items.add(
        Divider(color: Colors.grey[300], thickness: 1, height: 1),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize().init(context);

    double heightList;

    if(ResponsiveSize.phonePort || ResponsiveSize.tabPort){
      heightList = 66.0;
    }
    if(ResponsiveSize.phoneLand || ResponsiveSize.tabLand){
      heightList = 29.0;
    }

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
                      constraints: BoxConstraints(maxHeight: heightList * ResponsiveSize.height),
                      decoration: BoxDecoration(
                        color: AppTheme.selectedTabBackgroundColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: _buildList(viewModel.myBookings) //_buildList(viewModel.connects)
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







