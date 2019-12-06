import 'package:flutter/material.dart';
import 'package:shop_app/widgets/core/widgets/color.dart';

class ButtonWithLoading extends StatelessWidget {

  final bool isLoading;
  final String text;
  final Function onPressed;

  const ButtonWithLoading({
    @required this.isLoading,
    @required this.text,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: isLoading ? Loading() : Text(text),
      onPressed: isLoading ? null : onPressed,
    );
  }
}
