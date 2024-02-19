import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWithImage extends StatelessWidget {
  final double width, height;
  final double imageWidth, imageHeight;
  final String text;
  final String imagePath;
  final Function()? onPressed;
  const CustomButtonWithImage(
      {super.key,
      required this.width,
      required this.height,
      required this.text,
      this.onPressed,
      required this.imageWidth,
      required this.imageHeight,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size(width.w, height.h)),
        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(24.0.r), // Adjust the radius as needed
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: kSubColor,
              fontFamily: "Rubik",
              fontWeight: FontWeight.w400,
              fontSize: 17.sp,
            ),
          ),
          15.horizontalSpace,
          Image.asset(
            imagePath,
            width: imageWidth.w,
            height: imageHeight.h,
          ),
        ],
      ),
    );
  }
}
