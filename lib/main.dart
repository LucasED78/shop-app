import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth_provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/loading_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/auth/auth_screen.dart';
import 'package:shop_app/widgets/cart/CartScreen.dart';
import 'package:shop_app/widgets/core/keys/keys.dart';
import 'package:shop_app/widgets/order/order_screen.dart';
import 'package:shop_app/widgets/products/product_detail_screen.dart';

import 'package:shop_app/widgets/user_product/edit_user_product.dart';
import 'package:shop_app/widgets/user_product/user_product_screen.dart';

void main(){
  Keys.setKeys();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: OrderProvider(),
        ),
        ChangeNotifierProvider.value(
          value: LoadingProvider(),
        ),
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.indigoAccent,
//          hintColor: Theme.of(context).primaryColor,
          fontFamily: "Lato",
          textTheme: TextTheme(
            button: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
        ),
        home: AuthScreen(),
        routes: {
          ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
          CartScreen.routeName: (_) => CartScreen(),
          OrderScreen.routeName: (_) => OrderScreen(),
          UserProductScreen.routeName: (_) => UserProductScreen(),
          EditUserProduct.routeName: (_) => EditUserProduct()
        },
      ),
    );
  }
}