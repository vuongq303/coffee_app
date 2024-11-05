import 'package:coffee_app/main.dart';
import 'package:coffee_app/views/detail/detail_screen.dart';
import 'package:coffee_app/views/login_register/login_screen.dart';
import 'package:coffee_app/views/login_register/register_screen.dart';
import 'package:coffee_app/views/setting/person_detail.dart';
import 'package:coffee_app/views/setting/setting_screen.dart';
import 'package:coffee_app/transition/custom_transition_page_setting.dart';
import 'package:coffee_app/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _redOrageColor = Color.fromARGB(255, 209, 120, 66);

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
        GoRoute(
          path: '/setting',
          pageBuilder: (context, state) => buildMyTransition(
            child: const SettingScreen(),
            color: _redOrageColor,
          ),
          routes: [
            GoRoute(
              path: '/person-detail',
              pageBuilder: (context, state) => buildMyTransition(
                child: const PersonDetail(),
                color: _redOrageColor,
              ),
            ),
          ],
        )
      ],
    ),
  ],
);
