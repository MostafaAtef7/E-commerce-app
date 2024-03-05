import 'package:ecommerce/core/utils/functions/snack_bar_message.dart';
import 'package:ecommerce/core/utils/widgets/custom_app_bar.dart';
import 'package:ecommerce/features/home_view/data/model/products_model/products_model.dart';
import 'package:ecommerce/features/home_view/presentation/manager/home_cubit.dart';
import 'package:ecommerce/features/home_view/presentation/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;
  List<ProductsModel> products = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        iconButton: null,
      ),
      body: BlocConsumer<HomeCubit, HomeCubitState>(
        listener: (context, state) {
          if (state is HomeCubitLoading) {
            isLoading = true;
          } else if (state is HomeCubitFailure) {
            customSnackBarMessage(
                context: context,
                content: state.errMsg,
                backgroundColor: Colors.red);
          } else if (state is HomeCubitSuccess) {
            isLoading = false;
            products = state.products;
          }
        },
        builder: (context, state) {
          return isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : HomeViewBody(products: products);
        },
      ),
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
