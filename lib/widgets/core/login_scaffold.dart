
import 'package:flutter/material.dart';

class LoginScaffold extends StatelessWidget {

  final Widget body;

  LoginScaffold({ @required this.body });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );

  }
}
