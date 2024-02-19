import 'package:ecommerce/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    // required this.hintText,
    required this.suffixIcon,
    // required this.onSumbitted,
    required this.onChanged,
    // required this.validator,
    @required this.controller,
    required this.obsureText,
    required this.label,
    required this.onTap,
    // required this.aboveText,
  });
  // final String hintText;
  final Icon suffixIcon;
  final bool obsureText;
  // final Function(String)? onSumbitted;
  final Function(String)? onChanged;
  final Function()? onTap;
  // final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String label;
  // final String aboveText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0).r,
      child:
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(bottom:8.0,left: 15),
          //       child: Text(aboveText,style:const TextStyle(fontWeight: FontWeight.bold,fontFamily: "Rubik")),
          //     ),
          SizedBox(
        height: 70.h,
        width: 330.w,
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          // onFieldSubmitted: onSumbitted,
          validator: (value) {
            if(value == null || value.isEmpty) {
              return "Field is Required";
            }
             return null;
          },
          obscureText: obsureText,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: kPrimaryColor),borderRadius: BorderRadius.circular(24.r)),
            labelText: label,
            labelStyle: TextStyle(
              fontFamily: "Rubik",
              // fontWeight: FontWeight.bold,
              color: Colors.grey,
              fontSize: 12.sp,
            ),
            floatingLabelStyle: TextStyle(
              color: Colors.blue,
              fontSize: 15.sp,
            ),
            helperText: " ",
            contentPadding: const EdgeInsets.only(left: 18, top: 7).r,
            // hintText: hintText,
            hintStyle: TextStyle(fontSize: 13.sp),
            suffixIcon: suffixIcon,
            suffixIconColor: Colors.grey,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(24.r)),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(24.r)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(24.r)),
          ),
          onTap: onTap,
        ),
      ),
      // ],
      // ),
    );
  }
}
