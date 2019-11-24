import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';

class CartProvider with ChangeNotifier {
  Map<String, Cart> _items = {};

  Map<String, Cart> get items => _items;

  void addItem (String productId, String title, String imageUrl, double price){
    if (_items.containsKey(productId)){
      _items.update(productId, (existingCart){
        return  Cart(
          id: existingCart.id,
          title: existingCart.title,
          imageUrl: existingCart.imageUrl,
          price: existingCart.price,
          quantity: existingCart.quantity + 1
        );
      });
    }
    else {
      _items.putIfAbsent(productId, (){
        return Cart(
          id: DateTime.now().toString(),
          title: title,
          imageUrl: imageUrl,
          price: price,
          quantity: 1
        );
      });
    }

    notifyListeners();
  }

  int get itemsCount => _items.length;

  double get totalAmount {
    double total = 0;

    _items.forEach((key, item){
      total += item.price * item.quantity;
    });

    return total;
  }

  void removeItem(String productId){
    _items.remove(productId);
    notifyListeners();
  }
}