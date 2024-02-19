import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';

void customSnackBarMessage(
    {required BuildContext context,
    required String content,
    required Color contentColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: kSubColor,
      elevation: 2,
      content: Text(
        content,
        style: TextStyle(
          color: contentColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
