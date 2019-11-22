import 'package:flutter/material.dart';

class ShopScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final Drawer drawer;

  const ShopScaffold({
    @required this.title,
    @required this.body,
    this.drawer
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: drawer,
      body: body,
    );
  }
}
