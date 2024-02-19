import 'package:ecommerce/core/utils/classes/app_router.dart';
import 'package:ecommerce/core/utils/functions/snack_bar_message.dart';
import 'package:ecommerce/core/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../manager/auth_cubit.dart';
import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          iconButton: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20.r,
            ),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
        ),
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpAuthFailure) {
              customSnackBarMessage(
                  context: context,
                  content: state.errMsg,
                  contentColor: Colors.red);
              GoRouter.of(context).pushReplacement(AppRouter.signup);
            } else if (state is SignUpAuthLoading) {
              isLoading = true;
            } else if(state is SignUpAuthSuccess) {
              customSnackBarMessage(
                  context: context,
                  content: "Register done Successfully, please Sign in now",
                  contentColor: Colors.green);
              GoRouter.of(context).push(AppRouter.login);
              isLoading = false;
            }
            if (state is LoginAuthFailure) {
              customSnackBarMessage(
                  context: context,
                  content: state.errMsg,
                  contentColor: Colors.red);
            } else if (state is LoginAuthLoading) {
              isLoading = true;
            } else if(state is LoginAuthSuccess) {
              GoRouter.of(context).push(AppRouter.home);
              isLoading = false;
            }
          },
          builder: (context, state) {
            return !isLoading
                ? const SignUpViewBody()
                : const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
          },
        ));
  }
}
