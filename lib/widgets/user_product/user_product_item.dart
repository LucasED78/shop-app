import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/core/widgets/snackbar.dart';
import 'package:shop_app/widgets/user_product/edit_user_product.dart';

class UserProductItem extends StatelessWidget {

  final Product _product;

  UserProductItem(this._product);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints){
        return Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(_product.imageUrl),
            ),
            title: Text(_product.title),
            trailing: Container(
              width: constraints.maxWidth * 0.3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      Navigator.of(context).pushNamed(EditUserProduct.routeName, arguments: _product.id);
                    },
                  ),
                  Consumer<ProductsProvider>(
                    builder: (ctx, provider, _){
                      return IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          final Product _deletedProduct = _product;
                          provider.removeProduct(_product.id);

                          Snack.showSnackBar(context, CustomSnackBar(
                            content: "${_deletedProduct.title} successsfully removed!",
                            label: "undo",
                            onPressed: () => provider.addProduct(_deletedProduct)
                          ).snackBar);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
