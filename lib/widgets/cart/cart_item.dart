import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/widgets/core/widgets/alert_dialog.dart';
import 'package:shop_app/widgets/core/widgets/product_tile.dart';
import 'package:shop_app/widgets/core/widgets/snackbar.dart';

class CartItem extends StatelessWidget {

  final Cart _cartItem;
  final String productId;
  final Map<String, Cart> _removedCartItem = {};

  CartItem(this._cartItem, this.productId);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (ctx, cart, child){
        return Dismissible(
          direction: DismissDirection.startToEnd,
          child: child,
          key: ValueKey(_cartItem.id),
          background: Container(
            color: Theme.of(context).errorColor,
            alignment: Alignment.centerLeft,
            child: Icon(Icons.delete, color: Colors.white,),
          ),
          onDismissed: (_) {
            cart.removeItem(productId);
            _removedCartItem.putIfAbsent(productId, () => _cartItem);

            Snack.showSnackBar(context, CustomSnackBar(
              content: "product removed from cart",
              label: "undo",
              onPressed: (){
                cart.addItem(productId, _cartItem.title, _cartItem.imageUrl, _cartItem.price);
              },
            ).snackBar);
          },
          confirmDismiss: (_){
            return showDialog(
              context: context,
              builder: (ctx){
                return ConfirmAlertDialog(
                  title: "Are you sure?",
                  content: "Do you really want to remove this item?",
                  context: ctx,
                );
              }
            );
          },
        );
      },
      child: ProductTile(
        title: _cartItem.title,
        image: _cartItem.imageUrl,
        price: _cartItem.price,
        quantity: _cartItem.quantity,
      ),
    );
  }
}
