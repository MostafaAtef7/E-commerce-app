import 'package:ecommerce/core/utils/classes/app_router.dart';
import 'package:ecommerce/core/utils/functions/snack_bar_message.dart';
import 'package:ecommerce/core/utils/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: const CustomAppBar(
        iconButton: null,
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginAuthFailure) {
            customSnackBarMessage(
                context: scaffoldKey.currentContext!,
                content: state.errMsg,
                backgroundColor: Colors.red);
            GoRouter.of(context).pushReplacement(AppRouter.login);
          } else if (state is LoginAuthLoading) {
            isLoading = true;
          } else {
            GoRouter.of(context).push(AppRouter.home);
            isLoading = false;
          }
        },
        builder: (context, state) {
          return !isLoading
              ? const LoginViewBody()
              : const Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                );
        },
      ),
    );
  }
}
