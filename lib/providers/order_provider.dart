import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/order.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  void addOrder(List<Cart> cartItem, double amount) {
    _orders.insert(0, Order(
      id: DateTime.now().toString(),
      amount: amount,
      products: cartItem,
      orderedAt: DateTime.now()
    ));
  }
}