import 'package:coffee_app/viewmodels/cart_view_model.dart';
import 'package:coffee_app/views/cart/widgets/bottom/bottom_nav_cart.dart';
import 'package:coffee_app/views/cart/widgets/cart_item.dart';
import 'package:coffee_app/widgets/header_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = context.read<CartViewModel>();
    final color = cartViewModel.color;

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
            child: FutureBuilder(
              future: cartViewModel.allListCart,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final cartItem = snapshot.data![index];
                      return CartItem(cartItem: cartItem);
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          const BottomNavCart(),
        ],
      ),
    );
  }
}
