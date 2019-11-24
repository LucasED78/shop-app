import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';

class Order {
  String id;
  double amount;
  List<Cart> products;
  DateTime orderedAt;

  Order({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.orderedAt
  });
}