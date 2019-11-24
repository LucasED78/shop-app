import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/order.dart';

class OrderItem extends StatelessWidget {

  final Order _order;

  OrderItem(this._order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Text("\$${_order.amount}"),
        subtitle: Text(DateFormat("dd MM yyyy hh:mm").format(_order.orderedAt)),
        trailing: IconButton(
          icon: Icon(Icons.expand_more),
          onPressed: () => {},
        ),
      ),
    );
  }
}
