import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/error_provider.dart';

import 'package:shop_app/providers/products_provider.dart';

class ShopScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final Widget drawer;
  final List<Widget> actions;
  final bool noPadding;

  const ShopScaffold({
    @required this.title,
    @required this.body,
    this.drawer,
    this.actions,
    this.noPadding = false
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions != null ? actions : [],
      ),
      drawer: drawer,
      body: Provider.of<ErrorProvider>(context).error != null ? Center(child: Text(Provider.of<ErrorProvider>(context).error),) : !noPadding ? Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: body,
      ) : body,
    );
  }
}
