import 'package:ecommerce/core/utils/classes/app_router.dart';
import 'package:ecommerce/core/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../auth/presentation/manager/auth_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          height: 40,
          width: 330,
          text: "Log Out",
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).signOutFromGoogle();
            while (context.canPop()) {
              GoRouter.of(context).pop();
            }
            context.push(AppRouter.login);
          },
        ),
      ),
    );
  }
}
