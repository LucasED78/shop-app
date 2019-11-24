import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/widgets/cart/cart_item.dart';
import 'package:shop_app/widgets/cart/cart_summary.dart';
import 'package:shop_app/widgets/core/shop_scaffold.dart';

class CartScreen extends StatelessWidget {

  static const routeName = '/cart-summary';

  @override
  Widget build(BuildContext context) {
    return ShopScaffold(
      title: "Your cart",
      body: Consumer<CartProvider>(
        builder: (ctx, cart, _){
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: cart.itemsCount,
                  itemBuilder: (_, index){
                    return CartItem(
                      cart.items.values.toList()[index],
                      cart.items.keys.toList()[index]
                    );
                  },
                ),
              ),
              CartSummary(total: cart.totalAmount)
            ],
          );
        },
      ),
    );
  }
}
