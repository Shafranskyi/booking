import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

import '../defaultTab/defaultTab.dart';

import 'package:booking/setting/responsiveSize.dart';
import 'package:booking/setting/styling.dart';

class BubbleTab extends StatefulWidget {
  BubbleTab({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BubbleTabState();
}

class BubbleTabState extends State<BubbleTab> with SingleTickerProviderStateMixin{
  TabController _tabController;

  BubbleTabState();

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: Colors.black,
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: new BubbleTabIndicator(
        indicatorHeight: 5 * ResponsiveSize.height,
        indicatorColor: AppTheme.selectedTabBackgroundColor,
        tabBarIndicatorSize: TabBarIndicatorSize.tab,
      ),
      tabs: <Widget>[
        DefaultTab(title: 'Upcoming'),
        DefaultTab(title: 'Completed'),
        DefaultTab(title: 'Canceled')
      ],
      controller: _tabController,
    );
  }
}