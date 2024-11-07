import 'package:coffee_app/viewmodels/cart_view_model.dart';
import 'package:coffee_app/viewmodels/detail_view_model.dart';
import 'package:coffee_app/viewmodels/home_view_model.dart';
import 'package:coffee_app/viewmodels/login_view_model.dart';
import 'package:coffee_app/viewmodels/register_view_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/cart/cart_screen.dart';
import 'package:coffee_app/views/favorite/favorite_screen.dart';
import 'package:coffee_app/views/history/order_history.dart';
import 'package:coffee_app/views/home/home_screen.dart';
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
        Provider(create: (context) => CartViewModel()),
        Provider(create: (context) => HomeViewModel()),
        Provider(create: (context) => LoginViewModel()),
        Provider(create: (context) => RegisterViewModel()),
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

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    OrderHistory(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.badge),
            icon: Icon(Icons.badge_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_outlined),
            label: 'History',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: color.redOrange,
        unselectedItemColor: color.gray,
        iconSize: 21,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: _onItemTapped,
      ),
    );
  }
}
