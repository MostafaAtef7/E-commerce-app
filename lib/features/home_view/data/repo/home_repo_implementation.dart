import 'package:ecommerce/core/utils/classes/api_services.dart';
import 'package:ecommerce/features/home_view/data/model/products_model/products_model.dart';
import 'package:ecommerce/features/home_view/data/repo/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  @override
  Future<List<ProductsModel>> getAllProducts() async{
    try {
  List<Map<String,dynamic>> data = await ApiServices().get(url: "products");
  List<ProductsModel> products = [];
  for(var item in data) {
  products.add(ProductsModel.fromJson(item));
  }
  return products;
} catch (e) {
  print("!!!!!!!!!!!!!!");
  return [];
}

  }
  @override
  Future<List<ProductsModel>> getCategoty({required String categoryName}) async{
    try {
  List<Map<String,dynamic>> data = await ApiServices().get(url: "products/category/$categoryName");
  List<ProductsModel> products = [];
  for(var item in data) {
  products.add(ProductsModel.fromJson(item));
  }
  return products;
} catch (e) {
  print("!!!!!!!!!!!!!!");
  return [];
}
  }
}