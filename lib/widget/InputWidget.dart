import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final TextStyle textStyle;
  final TextEditingController controller;

  InputWidget({Key key, this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller}) : super(key: key);

  @override
  _InputWidgetState createState() => new _InputWidgetState(hintText, iconData, onChanged, textStyle, controller);
}

/// State for [GSYInputWidget] widgets.
class _InputWidgetState extends State<InputWidget> {
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final TextStyle textStyle;
  final TextEditingController controller;

  _InputWidgetState(this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller) : super();

  @override
  Widget build(BuildContext context) {
    return new TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: new InputDecoration(
        hintText: hintText,
        icon: new Icon(iconData),
      ),
    );
  }
}
