import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/providers/cart_provider.dart';
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
              content: "Produto removido do carrinho",
              label: "DESFAZER",
              onPressed: (){
                cart.addItem(productId, _cartItem.title, _cartItem.imageUrl, _cartItem.price);
              },
            ).snackBar);
          },
        );
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: _cartItem.imageUrl,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              placeholder: (ctx, _) => CircularProgressIndicator(backgroundColor: Theme.of(context).accentColor,),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  _cartItem.title,
                  style: Theme.of(context).textTheme.title,
                ),
                trailing: Text("\$${_cartItem.price * _cartItem.quantity}"),
                subtitle: Text("${_cartItem.quantity}x"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
