import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/loading_provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/widgets/core/widgets/color.dart';

class CartSummary extends StatelessWidget {

  final double total;

  CartSummary({
    @required this.total
  });

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context, listen: false);
    print("rebuildo");
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
                Chip(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  backgroundColor: Theme.of(context).primaryColor,
                  label: Text(
                    total.toString(),
                    style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title.color
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10,),
            Consumer<OrderProvider>(
              builder: (_, order, child){
                return Provider.of<LoadingProvider>(context).loading ? Loading() :
                RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: Theme.of(context).primaryColor,
                  child: Text("Buy now", style: Theme.of(context).textTheme.button,),
                  onPressed: () async{
                    await order.addOrder(context, _cartProvider.items.values.toList(), _cartProvider.totalAmount);
                    _cartProvider.clear();
                  }
                );
              },
            )
          ],
        ),
      )
    );
  }
}
