import 'package:ecommerce/core/utils/functions/snack_bar_message.dart';
import 'package:ecommerce/core/utils/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/login/presentation/manager/login_auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        iconButton: null,
      ),
      body: BlocConsumer<LoginAuthCubit, LoginAuthState>(
        listener: (context, state) {
          if (state is LoginAuthFailure) {
            customSnackBarMessage(
                context: context,
                content: state.errMsg,
                contentColor: Colors.red);
          }
        },
        builder: (context, state) {
          return state is LoginAuthSuccess
              ? const LoginViewBody()
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
