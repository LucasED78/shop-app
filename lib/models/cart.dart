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

  Map<String, Object> toJSON(){
    final cartMap = {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity
    };

    return cartMap;
  }

  factory Cart.fromJSON(dynamic data){
    return Cart(
      id: data['id'],
      title: data['title'],
      imageUrl: data['imageUrl'],
      price: data['price'],
      quantity: data['quantity']
    );
  }
}