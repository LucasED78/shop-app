import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/products_provider.dart';

class ShopScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final Drawer drawer;
  final List<Widget> actions;

  const ShopScaffold({
    @required this.title,
    @required this.body,
    this.drawer,
    this.actions
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions != null ? actions : [],
      ),
      drawer: drawer,
      body: body,
    );
  }
}
