import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gsy_github_app_flutter/page/LoginPage.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // add into event list
    new Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context) {
        return new LoginPage();
      }));
    });
    return new Container(
      color: Colors.white,
      child: new Center(
        child: new Text("news one", style: new TextStyle(color: Colors.black, fontSize:22.0)),
      ),
    );
  }
}