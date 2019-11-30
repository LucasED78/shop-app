import 'package:dio/dio.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/widgets/core/constants.dart';

class ProductService {
  Future<Map<String, dynamic>> saveProduct(Product product) async{
    Response response = await Dio().post(
      "${CONSTANTS.URL}/products.json",
      data: product.toJSON()
    );

    return response.data;
  }

}