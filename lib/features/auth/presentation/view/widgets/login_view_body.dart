import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/utils/classes/app_router.dart';
import 'package:ecommerce/core/utils/widgets/custom_buttom_with_image.dart';
import 'package:ecommerce/core/utils/widgets/custom_button.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../manager/auth_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email;
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> loginKey = GlobalKey();

  @override
  void dispose() {
    if (loginKey.currentState != null) {
      loginKey.currentState!.reset();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0).r,
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: loginKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/login.jpg",
                  width: 250.w, height: 250.h),
              40.verticalSpace,
              CustomTextFormField(
                // hintText: "email",
                suffixIcon: const Icon(Icons.email),
                onChanged: (value) {
                  email = value;
                },
                controller: null,
                obsureText: false,
                label: 'email',
                onTap: () {},
              ),
              CustomTextFormField(
                // hintText: "password",
                suffixIcon: const Icon(Icons.lock),
                onChanged: (value) {},
                controller: passwordController,
                obsureText: true,
                label: 'password',
                onTap: () {},
              ),
              20.verticalSpace,
              CustomButton(
                text: "login",
                onPressed: () {
                  if (loginKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).loginMethod(
                        email: email, password: passwordController.text);
                    print("login success!!!!!!!!!!!");
                  } else
                    print("login fail!!!!!!!!!!!");
                },
                width: 330,
                height: 50,
              ),
              25.verticalSpace,
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
                  ),
                ],
              ),
              25.verticalSpace,
              CustomButtonWithImage(
                text: "Continue with Gmail",
                onPressed: () {
                  // BlocProvider.of<AuthCubit>(context).signOutFromGoogle();
                  BlocProvider.of<AuthCubit>(context).signInWithGoogle();
                  GoRouter.of(context).push(AppRouter.home);
                },
                width: 330,
                height: 50,
                imagePath: "assets/images/gmail_logo.png",
                imageHeight: 30,
                imageWidth: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
