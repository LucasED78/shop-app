import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/cart.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/providers/loading_provider.dart';
import 'package:shop_app/services/order_service.dart';
import 'package:shop_app/widgets/core/widgets/color.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders => [..._orders];

  Future<void> addOrder(BuildContext context, List<Cart> cartItem, double amount) async{
    Order _order = Order(
      products: cartItem,
      amount: amount,
      orderedAt: DateTime.now()
    );

    Provider.of<LoadingProvider>(context).loading = true;
    await OrderService().makeOrder(_order);
    Provider.of<LoadingProvider>(context).loading = false;

    _orders.insert(0, _order);

    notifyListeners();
  }

  Future fetchOrder() async{
    final data = await OrderService().fetchOrder();

    List<Order> orders = [];

    data.forEach((k,v){
      orders.add(Order.fromJSON({ "id": k, ...v }));
    });

    _orders = orders;

    return _orders;
  }
}