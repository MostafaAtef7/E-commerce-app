import 'package:ecommerce/features/login/presentation/view/login_view.dart';
import 'package:ecommerce/features/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const login = "/login";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: login,
      builder: (context, state) => const LoginView(),)
    ],
  );
}
