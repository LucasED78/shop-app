import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/loading_provider.dart';
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

  Future<void> updateProduct(BuildContext context, Product product) async{
   final int productIndex = _products.indexWhere((p) => p.id == product.id);

   if (productIndex != -1) {
     Provider.of<LoadingProvider>(context).loading = true;
     await ProductService().updateProduct(product);
     _products[productIndex] = product;
     Provider.of<LoadingProvider>(context).loading = false;
   }
  }

  removeProduct(String id) {
    int prodIndex = _products.indexWhere((p) => p.id == id);
    Product deletedProduct = _products[prodIndex];
    _products.removeAt(prodIndex);
    notifyListeners();

    ProductService().deleteProduct(id)
      .then((_) => deletedProduct = null)
      .catchError((e){
        print(e);
        _products.insert(prodIndex, deletedProduct);
        notifyListeners();
    });

  }

  Future<void> fetchProducts(BuildContext context) async{
    Provider.of<LoadingProvider>(context).loading = true;
    final data = await ProductService().fetchProduct();
    final List<Product> loadedProducts = [];

    data.forEach((key, value){
      loadedProducts.add(Product.fromJSON({ "id": key, ...value }));
    });

    _products = loadedProducts;

    notifyListeners();

    Provider.of<LoadingProvider>(context).loading = false;
  }
}