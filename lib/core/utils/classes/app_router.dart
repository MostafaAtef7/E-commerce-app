import 'package:ecommerce/features/home_view/presentation/view/home_view.dart';
import 'package:ecommerce/features/login/presentation/manager/login_auth_cubit.dart';
import 'package:ecommerce/features/login/presentation/view/login_view.dart';
import 'package:ecommerce/features/sign_up/presentation/manager/sign_up_auth_cubit.dart';
import 'package:ecommerce/features/sign_up/presentation/view/sign_up_view.dart';
import 'package:ecommerce/features/splash/presentation/view/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const login = "/login";
  static const signup = "/signup";
  static const home = "/home";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginAuthCubit(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: signup,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpAuthCubit(),
          child: const SignUpView(),
        ),
      ),
            GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
