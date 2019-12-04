import 'package:dio/dio.dart';
import 'package:shop_app/models/order.dart';
import 'package:shop_app/widgets/core/constants.dart';

class OrderService {
  Future<void> makeOrder(Order order) async{
    print(order.toJSON().toString());
    return await Dio().post("${CONSTANTS.URL}/orders.json", data: order.toJSON());
  }
}