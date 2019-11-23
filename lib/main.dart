import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/products/product_detail_screen.dart';

import 'package:shop_app/widgets/products/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ProductsProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigoAccent,
          fontFamily: "Lato",
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (_) => ProductDetailScreen()
        },
      ),
    );
  }
}