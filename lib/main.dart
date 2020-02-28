import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:booking/state/appState.dart';
import 'package:booking/reducers/reducers.dart';
import 'package:booking/router/router.dart';
import 'package:booking/setting/styling.dart';
import 'package:booking/setting/sizeConfig.dart';

void main()
{
  final Store<AppState> _store = Store<AppState>(appStateReducer, initialState: AppState.initialState());
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.lightTheme,
                  home: Router(),
                );
              },
            );
          },
        )
    );
  }
}