import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/services/product_service.dart';

class ProductsProvider with ChangeNotifier {
  List <Product> _products = [];

  List<Product> get products => [..._products];

  List<Product> get favorites => _products.where((prodItem) => prodItem.isFavorite).toList();

  Product findByID(String productId) => _products.firstWhere((product) => product.id == productId);

  Future<void> addProduct(Product product) async {
    if (product != null) {
      await ProductService().saveProduct(product);
      _products.add(product);
      notifyListeners();
    }
  }

  void updateProduct(Product product) {
   final int productIndex = _products.indexWhere((p) => p.id == product.id);

   if (productIndex > 0) _products[productIndex] = product;
  }

  void removeProduct(String id){
    _products.removeWhere((product) => product.id == id);
    notifyListeners();
  }

  Future<void> fetchProducts() async{
    final data = await ProductService().fetchProduct();
    final List<Product> loadedProducts = [];

    data.forEach((key, value){
      loadedProducts.add(Product.fromJSON({ "id": key, ...value }));
    });

    _products = loadedProducts;

    notifyListeners();
  }
}