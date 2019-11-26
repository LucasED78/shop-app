import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/widgets/core/widgets/product_tile.dart';
import 'package:shop_app/widgets/order/order_items_list.dart';

class OrderItem extends StatefulWidget {

  final Order _order;

  OrderItem(this._order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("\$${widget._order.amount}"),
            subtitle: Text(DateFormat("dd/MM/yyyy hh:mm").format(widget._order.orderedAt)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded) OrderItemsList(widget._order.products)
        ],
      )
    );
  }
}
