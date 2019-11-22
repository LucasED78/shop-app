import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

class ProductItem extends StatelessWidget {

  final Product _product;

  ProductItem(this._product);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: CachedNetworkImage(
        imageUrl: _product.imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => CircularProgressIndicator(),
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.favorite, color: Theme.of(context).accentColor,),
          onPressed: () => {},
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
    );
  }
}
