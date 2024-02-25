import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

void customSnackBarMessage(
    {required BuildContext context,
    required String content,
    required Color backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      elevation: 2,
      content: Text(
        content,
        style: const TextStyle(
          color: kSubColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
