import 'package:ecommerce/features/home_view/presentation/view/widgets/product_container.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10, itemBuilder: (ctx, index) => const ProductContainer());
  }
}
