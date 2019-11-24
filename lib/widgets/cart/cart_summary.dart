import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {

  final double total;

  CartSummary({
    @required this.total
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
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
      )
    );
  }
}
