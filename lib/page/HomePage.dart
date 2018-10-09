import 'dart:async';

import 'package:Github_app_flutter/common/model/User.dart';
import 'package:Github_app_flutter/common/redux/GithubState.dart';
import 'package:flutter/material.dart';
import 'package:Github_app_flutter/common/style/Style.dart';
import 'package:Github_app_flutter/common/redux/UserRedux.dart';
import 'package:Github_app_flutter/widget/TabBarWidget.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
          new StoreBuilder<GithubState>(
            builder: (context, store) {
              new Future.delayed(const Duration(seconds: 2), () {
                User user = store.state.userInfo;
                user.login = "new login";
                user.name = "new name";
                store.dispatch(new UpdateUserAction(user));
              });
              return new Text(
                store.state.userInfo.login,
                style: Theme.of(context).textTheme.display1,
              );
            },
          ),
          new StoreConnector<GithubState, String>(
            converter: (store) => store.state.userInfo.name,
            builder: (context, count) {
              return new Text(
                count,
                style: Theme.of(context).textTheme.display1,
              );
            },
          ),
          new Icon(Icons.directions_bike),
        ],
        backgroundColor: GithubColors.primarySwatch,
        indicatorColor: Colors.white,
        title: "Title");
  }
}
