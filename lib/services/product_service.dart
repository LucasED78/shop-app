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

  Future<Map<String, dynamic>> fetchProduct() async{
    Response response = await Dio().get("${CONSTANTS.URL}/products.json");
    
    return response.data;
  }

  Future<void> updateProduct(Product product) async {
    return await Dio().patch("${CONSTANTS.URL}/products/${product.id}.json", data: product.toJSON());
  }

  Future<void> deleteProduct(String id) async {
    return await Dio().delete("${CONSTANTS.URL}/products/$id.json");
  }

}