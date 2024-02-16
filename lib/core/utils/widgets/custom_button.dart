import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final double width, height;
  final String text;
  final Function()? onPressed;
  const CustomButton({super.key, required this.width, required this.height, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(Size(width, height)),
        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(24.0), // Adjust the radius as needed
          ),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: kSubColor,
          fontFamily: "Rubik",
          fontWeight: FontWeight.w400,
          fontSize: 17,
        ),
      ),
    );
  }
}
