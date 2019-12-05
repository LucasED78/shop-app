import 'package:flutter/material.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/product.dart';

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

  Map<String, dynamic> toJSON(){
    final orderMap = {
      'amount': amount,
      'products': products.map<Map>((p) => p.toJSON()).toList(),
      'orderedAt': orderedAt.toString()
    };

    return orderMap;
  }

  factory Order.fromJSON(data) {
    return Order(
      id: data['id'],
      amount: data['amount'],
      products: data['products'].map<Cart>((c) => Cart.fromJSON(c)).toList(),
      orderedAt: DateTime.parse(data['orderedAt'])
    );
  }
}