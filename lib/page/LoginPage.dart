import 'package:flutter/material.dart';
import 'package:gsy_github_app_flutter/common/style/Style.dart';
import 'package:gsy_github_app_flutter/widget/FlexButton.dart';
import 'package:gsy_github_app_flutter/widget/InputWidget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Color(GithubColors.primaryValue),
        child: new Center(
            child: new Card(
                color: Color(GithubColors.cardWhite),
                margin: const EdgeInsets.all(20.0),
                child: new Padding(
                    padding: new EdgeInsets.only(
                        left: 30.0, top: 60.0, right: 30.0, bottom: 80.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image(
                            image: new AssetImage('static/images/logo.png'),
                            width: 80.0,
                            height: 80.0),
                        new Padding(padding: new EdgeInsets.all(10.0)),
                        new InputWidget(
                            hintText: "11111", iconData: Icons.access_alarm),
                        new Padding(padding: new EdgeInsets.all(10.0)),
                        new InputWidget(
                            hintText: "11111", iconData: Icons.access_alarm),
                        new Padding(padding: new EdgeInsets.all(30.0)),
                        new FlexButton(
                          text: GithubStrings.login_text,
                          color: Color(GithubColors.primaryValue),
                          textColor: Color(GithubColors.textWhite),
                          onPress: () {},
                        )
                      ],
                    )))));
  }
}
