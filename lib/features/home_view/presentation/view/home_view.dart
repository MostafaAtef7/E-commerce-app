import 'package:ecommerce/core/utils/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/home_view/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        iconButton: null,
      ),
      body: HomeViewBody(),
      // body: Center(
      //   child: CustomButton(
      //     height: 40,
      //     width: 330,
      //     text: "Log Out",
      //     onPressed: () {
      //       BlocProvider.of<AuthCubit>(context).signOutFromGoogle();
      //       while (context.canPop()) {
      //         GoRouter.of(context).pop();
      //       }
      //       context.push(AppRouter.login);
      //     },
      //   ),
      // ),
    );
  }
}
