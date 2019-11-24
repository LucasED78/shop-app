import 'package:flutter/material.dart';

class Cart {
  String id;
  String title;
  double price;
  int quantity;

  Cart({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.quantity
  });
}