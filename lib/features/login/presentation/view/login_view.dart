import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/utils/classes/app_router.dart';
import 'package:ecommerce/core/utils/widgets/custom_app_bar.dart';
import 'package:ecommerce/core/utils/widgets/custom_button.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController controller;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        iconButton: null,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/login.jpg",
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 3),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              // hintText: "email",
              suffixIcon: const Icon(Icons.email),
              onSumbitted: (value) {
                email = value;
              },
              onChanged: (value) {
                email = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field is Required";
                }
                return "Error";
              },
              controller: null,
              obsureText: false,
              label: 'Email',
            ),
            CustomTextFormField(
              // hintText: "password",
              suffixIcon: const Icon(Icons.lock),
              onSumbitted: (value) {
                password = value;
              },
              onChanged: (value) {
                password = value;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field is Required";
                }
                return "Error";
              },
              controller: null,
              obsureText: true,
              label: 'Password',
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              text: "login",
              onPressed: () {},
              width: 330,
              height: 50,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "create an account? ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rubik",
                      color: kPrimaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.signup);
                  },
                  child: const Text(
                    "SignUp",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Rubik",
                      color: Colors.blue,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
