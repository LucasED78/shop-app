import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/cart/CartScreen.dart';
import 'package:shop_app/widgets/core/shop_scaffold.dart';
import 'package:shop_app/widgets/core/widgets/badge.dart';
import 'package:shop_app/widgets/core/widgets/popup_menu.dart';
import 'package:shop_app/widgets/products/product_item.dart';

enum FilterOptions {
  Favorites,
  All
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool _onlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    final ProductsProvider _provider = Provider.of<ProductsProvider>(context);
    List<Product> _products = _onlyFavorites ? _provider.favorites : _provider.products;

    return ShopScaffold(
      title: "Products",
      actions: [
        PopupMenu(
          items: [
            PopupMenuItem(
              child: Text("Only favorites"),
              value: FilterOptions.Favorites,
            ),
            PopupMenuItem(
              child: Text("Show all"),
              value: FilterOptions.All,
            )
          ],
          onSelected: (value){
            setState(() {
              if (value == FilterOptions.Favorites)  _onlyFavorites = true;
              else _onlyFavorites = false;
            });
          },
        ),
        Consumer<CartProvider>(
          builder: (context, cart, ch){
            return Badge(
              value: cart.itemsCount.toString(),
              color: Colors.black,
              child: ch,
            );
          },
          child: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.of(context).pushNamed(CartScreen.routeName),
          ),
        )
      ],
      body: GridView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: _products[index],
          child: ProductItem(),
        ),
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
