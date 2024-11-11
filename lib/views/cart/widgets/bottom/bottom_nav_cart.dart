import 'package:coffee_app/modules/native_module.dart';
import 'package:coffee_app/viewmodels/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavCart extends StatelessWidget {
  const BottomNavCart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartViewModel = context.watch<CartViewModel>();
    final module = context.read<NativeModule>();
    final color = cartViewModel.color;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 14,
                    color: color.gray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.attach_money,
                      size: 20,
                      color: color.redOrange,
                    ),
                    ValueListenableBuilder(
                      valueListenable: cartViewModel.totalPriceInCart,
                      builder: (context, value, child) {
                        return Text(
                          "$value",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: color.black,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: GestureDetector(
              onTap: () async {
                await module.pushNotification();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: color.redOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Checkout',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
