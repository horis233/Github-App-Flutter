import 'dart:async';

import 'package:Github_app_flutter/common/redux/GithubState.dart';
import 'package:flutter/material.dart';
import 'package:Github_app_flutter/common/dao/UserDao.dart';
//import 'package:Github_app_flutter/page/HomePage.dart';
//import 'package:Github_app_flutter/page/LoginPage.dart';
import 'package:flutter_redux/flutter_redux.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    toNext(res) {
      String widget;
      if (res != null && res.result) {
        widget = "home";
      } else {
        widget = "login";
      }
      Navigator.pushReplacementNamed(context, widget);
    }
    // add into event list
    return StoreBuilder<GithubState>(
      builder: (context, store) {
        new Future.delayed(const Duration(seconds: 2), () {
          UserDao.initUserInfo(store).then((res) {
            toNext(res);
          });
        });
        return new Container(
          color: Colors.white,
          child: new Center(
            child: new Text("Welcome", style: new TextStyle(color: Colors.black, fontSize: 22.0)),
          ),
        );
      },
    );
  }
}