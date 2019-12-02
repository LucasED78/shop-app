import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String id;
  String title;
  String description;
  double price;
  String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false
  });

  void toggleFavorite(){
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Map<String, dynamic> toJSON () {
    final productJSON = {
      "title": title,
      "description": description,
      "price": price,
      "imageUrl": imageUrl,
      "isFavorite": isFavorite
    };

    if (id != null) productJSON['id'] = id;

    return productJSON;
  }

  factory Product.fromJSON(dynamic data){
    return Product(
      id: data['id'],
      title: data['title'],
      description: data['title'],
      price: data['price'],
      imageUrl: data['imageUrl'],
      isFavorite: data['isFavorite']
    );
  }
}