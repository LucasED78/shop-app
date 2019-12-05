import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/loading_provider.dart';
import 'package:shop_app/services/product_service.dart';
import 'package:shop_app/widgets/products/product_item.dart';

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

  void toggleFavorite(BuildContext context) async{
    bool cachedFavorite = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    await ProductService().updateProduct(this)
      .catchError((_) {
        isFavorite = cachedFavorite;
        notifyListeners();
    });
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
      description: data['description'],
      price: data['price'],
      imageUrl: data['imageUrl'],
      isFavorite: data['isFavorite']
    );
  }
}