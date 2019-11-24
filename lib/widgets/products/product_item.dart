import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/widgets/products/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

//  final Product _product;

//  ProductItem(this._product);

  @override
  Widget build(BuildContext context) {
    final Product _provider = Provider.of<Product>(context, listen: false);
    final CartProvider _cartProvider = Provider.of<CartProvider>(context, listen: false);
    print("aaa");
    return GestureDetector(
      child: GridTile(
        child: CachedNetworkImage(
          imageUrl: _provider.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url){
            return Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColorLight));
          },
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, _){
              return IconButton(
                icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).accentColor
                ),
                onPressed: () => product.toggleFavorite(),
              );
            },
          ),
          title: Text(_provider.title,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart, color: Theme.of(context).accentColor,),
            onPressed: () => _cartProvider.addItem(_provider.id, _provider.title, _provider.imageUrl, _provider.price),
          ),
          backgroundColor: Colors.black87,
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: _provider.id),
    );
  }
}
