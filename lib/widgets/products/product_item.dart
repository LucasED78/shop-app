import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/products/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

  final Product _product;

  ProductItem(this._product);

  @override
  Widget build(BuildContext context) {

    final ProductsProvider _provider = Provider.of<ProductsProvider>(context);

    return GestureDetector(
      child: GridTile(
        child: CachedNetworkImage(
          imageUrl: _product.imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url){
            return Center(child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColorLight));
          },
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              _product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Theme.of(context).accentColor
            ),
            onPressed: () => _provider.toggleFavorite(_product),
          ),
          title: Text(_product.title,
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart, color: Theme.of(context).accentColor,),
            onPressed: () => {},
          ),
          backgroundColor: Colors.black87,
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed(ProductDetailScreen.routeName, arguments: _product.id),
    );
  }
}
