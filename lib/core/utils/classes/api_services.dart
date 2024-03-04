import 'package:dio/dio.dart';
import 'package:ecommerce/features/home_view/data/model/products_model/products_model.dart';

class ApiServices {
  final String _baseUrl = "https://fakestoreapi.com/";
  final Dio _dio = Dio();

  Future<List<Map<String,dynamic>>> get({required String url}) async {
    Response response = await _dio.get("$_baseUrl$url");
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String url, required ProductsModel productsModel}) async {
    Response response = await _dio.post("$_baseUrl$url", data: productsModel);
    return response.data;
  }  
  Future<Map<String, dynamic>> put(
      {required String url,required String productID ,  required ProductsModel productsModel}) async {
    Response response = await _dio.put("$_baseUrl$url/$productID", data: productsModel);
    return response.data;
  }

    Future<Map<String, dynamic>> delete(
      {required String url,required String productID}) async {
    Response response = await _dio.delete("$_baseUrl$url/$productID");
    return response.data;
  }
}
