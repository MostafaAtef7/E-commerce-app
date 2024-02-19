import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/utils/classes/app_router.dart';
import 'package:ecommerce/core/utils/functions/snack_bar_message.dart';
import 'package:ecommerce/core/utils/widgets/custom_buttom_with_image.dart';
import 'package:ecommerce/core/utils/widgets/custom_button.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../manager/auth_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  late String userName;
  late String email;
  late String password;
  late String confirmPassword;
  late TextEditingController birthdayController = TextEditingController();
  late TextEditingController useNameController = TextEditingController();
  GlobalKey<FormState> signUpKey = GlobalKey();

  @override
  void dispose() {
    birthdayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: signUpKey,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset("assets/images/signup.jpg", width: 250.h, height: 250.h),
          30.verticalSpace,
          CustomTextFormField(
            // hintText: "email",
            suffixIcon: const Icon(Icons.person),
            onChanged: (value) {
              email = value;
            },
            controller: null,
            obsureText: false,
            label: 'user name',
            onTap: () {},
          ),
          CustomTextFormField(
            // hintText: "password",
            suffixIcon: const Icon(Icons.calendar_today),
            onChanged: (value) {
              password = value;
            },
            controller: birthdayController,
            obsureText: false,
            label: 'birthday',
            onTap: () {
              pickDate();
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
          CustomTextFormField(
            // hintText: "email",
            suffixIcon: const Icon(Icons.email),
            controller: null,
            obsureText: false,
            label: 'email',
            onTap: () {},
            onChanged: (value) {
              email = value;
            },
          ),
          CustomTextFormField(
            // hintText: "password",
            suffixIcon: const Icon(Icons.lock),
            onChanged: (value) {
              password = value;
            },
            controller: null,
            obsureText: true,
            label: 'password',
            onTap: () {},
          ),
          CustomTextFormField(
            // hintText: "password",
            suffixIcon: const Icon(Icons.lock),
            onChanged: (value) {
              confirmPassword = value;
            },
            controller: null,
            obsureText: true,
            label: 'confirm password',
            onTap: () {},
          ),
          15.verticalSpace,
          CustomButton(
            text: "SignUp",
            onPressed: () {
              if (signUpKey.currentState!.validate() &&
                  password == confirmPassword) {
                BlocProvider.of<AuthCubit>(context)
                    .signUpMethod(email: email, password: password);
                print("sign up success!!!!!!!!!!!");
              } else {
                customSnackBarMessage(
                    context: context,
                    content: "Password does not match",
                    contentColor: Colors.red);
              }
            },
            width: 330.w,
            height: 50.h,
          ),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "have an account? ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "Rubik",
                    color: kPrimaryColor),
              ),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: const Text(
                  "SignIn",
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
          25.verticalSpace,
        ]),
      ),
    );
  }

  Future<void> pickDate() async {
    DateTime? picker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picker != null) {
      setState(() {
        birthdayController.text = picker.toString().split(" ")[0];
      });
    } else {
      birthdayController.text = "";
    }
  }
}
