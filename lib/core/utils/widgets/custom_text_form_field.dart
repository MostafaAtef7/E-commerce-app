import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    // required this.hintText,
    required this.suffixIcon,
    required this.onSumbitted,
    required this.onChanged,
    required this.validator,
    @required this.controller,
    required this.obsureText, required this.label,
  });
  // final String hintText;
  final Icon suffixIcon;
  final bool obsureText;
  final Function(String)? onSumbitted;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 50,
        width: 330,
        child: TextFormField(
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onSumbitted,
          validator: validator,
          obscureText: obsureText,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontFamily: "Rubik",
              // fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 15,
            ),
            contentPadding: const EdgeInsets.only(left: 18,top: 7),
            // hintText: hintText,
            // hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
            suffixIcon: suffixIcon,
            suffixIconColor: Colors.grey,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
            enabledBorder: OutlineInputBorder(
                gapPadding: 10, borderRadius: BorderRadius.circular(24)),
            focusedBorder: OutlineInputBorder(
                gapPadding: 10, borderRadius: BorderRadius.circular(24)),
          ),
        ),
      ),
    );
  }
}
