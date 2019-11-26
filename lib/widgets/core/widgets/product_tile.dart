import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {

  final String image;
  final String title;
  final int quantity;
  final double price;

  ProductTile({
    @required this.image,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            placeholder: (ctx, _) => CircularProgressIndicator(backgroundColor: Theme.of(context).accentColor,),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                title,
                style: Theme.of(context).textTheme.title,
              ),
              trailing: Text("${price * quantity}"),
              subtitle: Text("$quantity x"),
            ),
          )
        ],
      ),
    );
  }
}
