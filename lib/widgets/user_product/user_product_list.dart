import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/user_product/user_product_item.dart';

class UserProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (ctx, product, _){
        return ListView.builder(
          itemCount: product.products.length,
          itemBuilder: (_, index){
            if (index < product.products.length - 1) {
              return Column(
                children: <Widget>[
                  UserProductItem(product.products[index]),
                  Divider()
                ],
              );
            }
            else return UserProductItem(product.products[index]);
          },
        );
      },
    );
  }
}
