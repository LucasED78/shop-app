import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items => _items;

  void addItem (String productId, String title, double price){
    if (_items.containsKey(productId)){
      _items.update(productId, (existingCart){
        return  Cart(
          id: existingCart.id,
          title: existingCart.title,
          price: existingCart.price,
          quantity: existingCart.quantity++
        );
      });
    }
    else {
      _items.putIfAbsent(productId, (){
        return Cart(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1
        );
      });
    }
  }
}