import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/core/shop_scaffold.dart';
import 'package:shop_app/widgets/core/widgets/side_drawer/drawer.dart';
import 'package:shop_app/widgets/user_product/edit_user_product.dart';
import 'package:shop_app/widgets/user_product/user_product_list.dart';

class UserProductScreen extends StatelessWidget {

  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    print("rebui");
    return ShopScaffold(
      title: "User Products",
      drawer: SideDrawer(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.of(context).pushNamed(EditUserProduct.routeName),
        )
      ],
      body: RefreshIndicator(
        onRefresh: () => Provider.of<ProductsProvider>(context).fetchProducts(context),
        child: UserProductList(),
      )
    );
  }
}
