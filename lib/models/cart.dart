import 'package:flutter/material.dart';

class Cart {
  String id;
  String imageUrl;
  String title;
  double price;
  int quantity;

  Cart({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.price,
    @required this.quantity
  });
}