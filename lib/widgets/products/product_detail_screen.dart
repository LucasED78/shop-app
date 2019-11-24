import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/cart_provider.dart' as prefix0;

import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/cart/CartScreen.dart';
import 'package:shop_app/widgets/core/shop_scaffold.dart';
import 'package:shop_app/widgets/core/widgets/badge.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {

    final String productId = ModalRoute.of(context).settings.arguments as String;
    final Product _product = Provider.of<ProductsProvider>(context, listen: false).findByID(productId);
    final CartProvider _cartProvider = Provider.of<prefix0.CartProvider>(context, listen: false);

    return ShopScaffold(
      title: _product.title,
      actions: <Widget>[
        Consumer<CartProvider>(
          builder: (_, cart, child){
            return Badge(
              color: Colors.black,
              value: cart.itemsCount.toString(),
              child: child,
            );
          },
          child: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
          ),
        )
      ],
      body: ListView(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: _product.imageUrl,
            fit: BoxFit.cover,
          ),
          ListTile(
            leading: FittedBox(
              child: Text(_product.title, style: Theme.of(context).textTheme.title,),
            ),
            trailing: FittedBox(
              child: Text(_product.price.toString(), style: Theme.of(context).textTheme.title,),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              _product.description,
              style: TextStyle(
                  fontSize: 16
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  child: Text("Buy now", style: Theme.of(context).textTheme.button,),
                  color: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  onPressed: () => {},
                ),
                const SizedBox(height: 10,),
                FlatButton(
                  child: Text("Add to cart", style: Theme.of(context).textTheme.button,),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Theme.of(context).primaryColor)
                  ),
                  onPressed: () => _cartProvider.addItem(_product.id, _product.title, _product.imageUrl, _product.price),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
