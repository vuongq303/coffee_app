import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/widgets/header_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HeaderNavigation(
          color: color,
          title: 'Cart',
        ),
      ),
    );
  }
}
