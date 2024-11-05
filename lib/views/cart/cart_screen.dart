import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/cart/data/home_data.dart';
import 'package:coffee_app/views/cart/widgets/bottom/bottom_nav_cart.dart';
import 'package:coffee_app/views/cart/widgets/cart_item.dart';
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartCoffeeList.length,
              itemBuilder: (context, index) {
                final cartItem = cartCoffeeList[index];
                return CartItem(cartItem: cartItem);
              },
            ),
          ),
          const BottomNavCart(),
        ],
      ),
    );
  }
}