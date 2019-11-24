import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/order_provider.dart';
import 'package:shop_app/widgets/order/order_item.dart';

class OrderScreen extends StatelessWidget {

  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    final OrderProvider _orderProvider = Provider.of<OrderProvider>(context);

    return ListView.builder(
      itemCount: _orderProvider.orders.length,
      itemBuilder: (_, index) => OrderItem(_orderProvider.orders[index]),
    );
  }
}
