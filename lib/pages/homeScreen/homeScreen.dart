import 'topContainer/landscape/topContainerLandscape.dart';
import 'topContainer/portrait/topContainerPortrait.dart';

import 'package:booking/models/viewModel.dart';
import 'package:booking/models/homeItem/homeItem.dart';
import 'package:booking/state/appState.dart';
import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/responsiveWidget.dart';
import 'package:booking/setting/strings.dart';
import 'package:booking/setting/styling.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Widget> _buildList(List<HomeItem> list) {
    List<Widget> items = []; // this will hold Rows according to available lines
    for (var line in list.toList()) {
      items.add(HomeItem(
          name: line.name,
          recommended: line.recommended,
          price: line.price,
          rating: line.rating,
          imagePath: line.imagePath
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize().init(context);
    return Scaffold(
      backgroundColor: AppTheme.white,
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
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 3.0 * ResponsiveSize.width,
                                vertical: 3.2 * ResponsiveSize.height,
                              ),
                              child: Text(
                                Strings.HostelsNearby,
                                style: Theme.of(context).textTheme.title,
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: _buildList(viewModel.hostelsNearby)
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 2.0 * ResponsiveSize.height),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.0 * ResponsiveSize.width,
                                  vertical: 1 * ResponsiveSize.height,
                                ),
                                child: Text(
                                  Strings.IDeals,
                                  style: Theme.of(context).textTheme.title,
                                ),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: _buildList(viewModel.hostelsNearby)
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            );
          }
      ),
    );
  }
}