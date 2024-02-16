import 'package:ecommerce/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(iconButton: null,),
    );
  }
}