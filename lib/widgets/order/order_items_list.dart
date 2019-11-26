import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/widgets/core/widgets/product_tile.dart';

class OrderItemsList extends StatelessWidget {

  final List<Cart> _cartItems;

  OrderItemsList(this._cartItems);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _cartItems.length,
      itemBuilder: (_, index){
        return ProductTile(
          title: _cartItems[index].title,
          image: _cartItems[index].imageUrl,
          price: _cartItems[index].price,
          quantity: _cartItems[index].quantity,
        );
      },
    );
  }
}
