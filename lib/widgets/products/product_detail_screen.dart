import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';

import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/providers/products_provider.dart' as prefix0;
import 'package:shop_app/widgets/core/shop_scaffold.dart';

class ProductDetailScreen extends StatelessWidget {

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {

    final String productId = ModalRoute.of(context).settings.arguments as String;
    final Product _product = Provider.of<ProductsProvider>(context).findByID(productId);

    return ShopScaffold(
      title: _product.title,
      body: Container(),
    );
  }
}
