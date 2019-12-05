import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/loading_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/utils/async_utils.dart';
import 'package:shop_app/widgets/cart/CartScreen.dart';
import 'package:shop_app/widgets/core/shop_scaffold.dart';
import 'package:shop_app/widgets/core/widgets/badge.dart';
import 'package:shop_app/widgets/core/widgets/color.dart';
import 'package:shop_app/widgets/core/widgets/no_items.dart';
import 'package:shop_app/widgets/core/widgets/popup_menu.dart';
import 'package:shop_app/widgets/core/widgets/side_drawer/drawer.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();

    AsyncUtils.delayState()
      .then((_){
        Provider.of<ProductsProvider>(context).fetchProducts(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build overview");
    final ProductsProvider _provider = Provider.of<ProductsProvider>(context);
    final LoadingProvider _loadingProvider = Provider.of<LoadingProvider>(context );
    List<Product> _products = _onlyFavorites ? _provider.favorites : _provider.products;

    return ShopScaffold(
      title: "Products",
      drawer: SideDrawer(),
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
      body: _loadingProvider.loading ? Loading() : GridView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: _products[index],
          child: _products.isEmpty ? NoItems(
            "No products encountered"
          ) : ProductItem(),
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
