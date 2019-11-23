import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/core/shop_scaffold.dart';
import 'package:shop_app/widgets/products/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductsProvider _provider = Provider.of<ProductsProvider>(context);
    List<Product> _products = _provider.products;
    return ShopScaffold(
      title: "Products",
      body: GridView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => ProductItem(_products[index]),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3/2
        ),
      ),
    );
  }
}