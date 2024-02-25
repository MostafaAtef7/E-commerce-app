import 'package:ecommerce/core/utils/classes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              )
            ]),
        child: ListTile(
          leading: const Icon(Icons.work),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 15,
          ),
          title: const Text(
            "Data Science",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          subtitle: const Column(
            children: [
              Row(
                children: [
                  Text(
                    "Location: Cairo",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Date: 2/4/2024",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Join Our Team: Unleash the Power of Data Science to Drive Innovation and Insights",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          onTap: () {
            GoRouter.of(context).push(AppRouter.productDetails);
          },
        ),
      ),
    );
  }
}
