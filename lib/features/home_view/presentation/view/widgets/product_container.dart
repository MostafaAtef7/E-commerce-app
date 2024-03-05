import 'package:ecommerce/core/utils/classes/app_router.dart';
import 'package:ecommerce/features/home_view/data/model/products_model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key, required this.product});
  final ProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0).h,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.productDetails);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).w,
          height: 120.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24).r,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 5.r,
                  spreadRadius: 2.r,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                product.image!,
                height: 60.w,
                width: 50.w,
                fit: BoxFit.fill,
              ),
              15.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${product.title}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    5.verticalSpace,
                    Row(
                      children: [
                        Text(
                          "${product.price}",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        25.horizontalSpace,
                        Text(
                          "${product.rating!.rate}",
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    5.verticalSpace,
                    Text(
                      product.description!,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              15.horizontalSpace,
              Icon(
                Icons.arrow_forward_ios,
                size: 18.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
