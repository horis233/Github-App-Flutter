import 'package:flutter/material.dart';
import 'package:gsy_github_app_flutter/common/style/Style.dart';
import 'package:gsy_github_app_flutter/widget/TabBarWidget.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new TabBarWidget(
        type: TabBarWidget.BOTTOM_TAB,
        tabItems: [
          new Tab(icon: new Icon(Icons.directions_car)),
          new Tab(icon: new Icon(Icons.directions_transit)),
          new Tab(icon: new Icon(Icons.directions_bike)),
        ],
        tabViews: [
          new Icon(Icons.directions_car),
          new Icon(Icons.directions_transit),
          new Icon(Icons.directions_bike),
        ],
        backgroundColor: GithubColors.primarySwatch,
        indicatorColor: Colors.white,
        title: "Title");
  }
}