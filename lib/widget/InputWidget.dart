import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final IconData iconData;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final TextStyle textStyle;
  final TextEditingController controller;

  InputWidget({Key key, this.hintText, this.iconData, this.onChanged, this.textStyle, this.controller, this.obscureText = false}) : super(key: key);


  @override
  _InputWidgetState createState() => new _InputWidgetState(
      hintText, iconData, obscureText, onChanged, textStyle, controller);
}

/// State for [InputWidget] widgets.
class _InputWidgetState extends State<InputWidget> {
  final String hintText;
  final IconData iconData;
  final bool obscureText;
  final ValueChanged<String> onChanged;
  final TextStyle textStyle;
  final TextEditingController controller;

  _InputWidgetState(this.hintText, this.iconData, this.obscureText,
      this.onChanged, this.textStyle, this.controller)
      : super();

  @override
  Widget build(BuildContext context) {
    print(obscureText);
    return new TextField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: new InputDecoration(
        hintText: hintText,
        icon: new Icon(iconData),
      ),
    );
  }
}
