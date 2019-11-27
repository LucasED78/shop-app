import 'package:flutter/material.dart';

class Snack {
  static showSnackBar(BuildContext context, SnackBar snackBar) {
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

class CustomSnackBar {

  final String content;
  final String label;
  final Function onPressed;

  CustomSnackBar({
    @required this.content,
    @required this.label,
    @required this.onPressed
  });

  get snackBar {
    return SnackBar(
      content: Text(content),
      action: SnackBarAction(
        label: label,
        onPressed: onPressed,
      ),
    );
  }
}
