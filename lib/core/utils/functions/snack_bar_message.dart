import 'package:flutter/material.dart';

void customSnackBarMessage(
    {required BuildContext context,
    required String content,
    required Color contentColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: TextStyle(color: contentColor),
      ),
    ),
  );
}
