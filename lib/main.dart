import 'package:coffee_app/viewmodels/detail_view_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => MyColor()),
        Provider(create: (context) => DetailViewModel()),
      ],
      child: MaterialApp.router(
        title: 'Flutter App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
