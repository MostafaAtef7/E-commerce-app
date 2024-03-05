import 'package:ecommerce/features/home_view/data/model/products_model/products_model.dart';
import 'package:ecommerce/features/home_view/presentation/view/widgets/product_container.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.products});
  final List<ProductsModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length, itemBuilder: (ctx, index) => ProductContainer(product: products[index]));
  }
}
