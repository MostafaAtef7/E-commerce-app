import 'package:ecommerce/features/auth/presentation/view/login_view.dart';
import 'package:ecommerce/features/home_view/data/repo/home_repo_implementation.dart';
import 'package:ecommerce/features/home_view/presentation/manager/home_cubit.dart';
import 'package:ecommerce/features/home_view/presentation/view/home_view.dart';
import 'package:ecommerce/features/product_details/presentation/view/product_details_view.dart';
import 'package:ecommerce/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../features/auth/presentation/manager/auth_cubit.dart';
import '../../../features/auth/presentation/view/sign_up_view.dart';

abstract class AppRouter {
  static const login = "/login";
  static const signup = "/signup";
  static const home = "/home";
  static const productDetails = "/productDetails";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(HomeRepoImplementation())..fetchAllProducts(),
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const ProductDetailsView(),
      ),
    ],
  );
}
