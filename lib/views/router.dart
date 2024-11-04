import 'package:coffee_app/main.dart';
import 'package:coffee_app/views/detail/detail_screen.dart';
import 'package:coffee_app/views/login_register/login_screen.dart';
import 'package:coffee_app/views/login_register/register_screen.dart';
import 'package:coffee_app/views/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => RegisterScreen(),
        ),
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeApp(),
        ),
        GoRoute(
          path: '/detail',
          builder: (context, state) => const DetailScreen(),
        ),
      ],
    ),
  ],
);
