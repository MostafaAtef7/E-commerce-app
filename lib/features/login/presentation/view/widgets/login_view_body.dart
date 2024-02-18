import 'package:ecommerce/constant.dart';
import 'package:ecommerce/core/utils/classes/app_router.dart';
import 'package:ecommerce/core/utils/widgets/custom_button.dart';
import 'package:ecommerce/core/utils/widgets/custom_text_form_field.dart';
import 'package:ecommerce/features/login/presentation/manager/login_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late String email;
  late String password;
  GlobalKey<FormState> loginKey = GlobalKey();
  AutovalidateMode autoValidate = AutovalidateMode.always;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidate,
      key: loginKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/login.jpg", width: 250.w, height: 250.h),
            40.verticalSpace,
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
                return null;
              },
              controller: null,
              obsureText: false,
              label: 'email',
              onTap: () {
              },
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
                return null;
              },
              controller: null,
              obsureText: true,
              label: 'password',
              onTap: () {},
            ),
            20.verticalSpace,
            CustomButton(
              text: "login",
              onPressed: () {
                if (loginKey.currentState!.validate()) {
                  BlocProvider.of<LoginAuthCubit>(context)
                      .loginMethod(email: email, password: password);
                  print("login success!!!!!!!!!!!");
                } else
                  print("login fail!!!!!!!!!!!");
              },
              width: 330.w,
              height: 50.h,
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
            )
          ],
        ),
      ),
    );
  }
}
