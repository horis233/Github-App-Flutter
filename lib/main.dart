import 'package:Github_app_flutter/common/style/Style.dart';
import 'package:Github_app_flutter/page/HomePage.dart';
import 'package:Github_app_flutter/page/LoginPage.dart';
import 'package:Github_app_flutter/common/model/User.dart';
import 'package:Github_app_flutter/common/redux/GithubState.dart';

import 'package:flutter/material.dart';
import 'package:Github_app_flutter/page/WelcomePage.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


void main() {
  runApp(new FlutterReduxApp());
}

class FlutterReduxApp extends StatelessWidget {
  final store = new Store<GithubState>(counterReducer, initialState:  new GithubState(userInfo: User.empty()));
  FlutterReduxApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
          title: 'Flutter Demo',
          theme: new ThemeData(
            primarySwatch: GithubColors.primarySwatch,
          ),
          routes: {
            "/": (context) {
              return WelcomePage();
            },
            "home": (context) {
              return HomePage();
            },
            "login": (context) {
              return LoginPage();
            },
          }),
    );
  }
}
