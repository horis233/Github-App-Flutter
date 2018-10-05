import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final IconData iconData;

  InputWidget({Key key, this.hintText, this.iconData}) : super(key: key);

  @override
  _InputWidgetState createState() => new _InputWidgetState(hintText, iconData);
}

/// State for [GSYInputWidget] widgets.
class _InputWidgetState extends State<InputWidget> {
  final String hintText;
  final IconData iconData;
  final TextEditingController _controller = new TextEditingController();

  _InputWidgetState(this.hintText, this.iconData) : super();

  @override
  Widget build(BuildContext context) {
    return new TextField(
      controller: _controller,
      decoration: new InputDecoration(
        hintText: hintText,
        icon: new Icon(iconData),
      ),
    );
  }
}
