import 'package:ecommerce/features/home_view/data/model/products_model/products_model.dart';

abstract class HomeRepo {
  Future<List<ProductsModel>> getAllProducts();
  Future<List<ProductsModel>> getCategoty({required String categoryName});
} 