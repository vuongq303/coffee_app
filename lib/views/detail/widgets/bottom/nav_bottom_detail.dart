import 'package:coffee_app/viewmodels/cart_view_model.dart';
import 'package:coffee_app/viewmodels/detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBottomDetail extends StatelessWidget {
  const NavBottomDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final detailViewModel = context.watch<DetailViewModel>();
    final cartViewModel = context.read<CartViewModel>();
    final price = detailViewModel.priceInDetailScreen;
    final color = detailViewModel.color;
    final idCoffee = detailViewModel.coffeeModel.id;
    final itemSizeSelected = detailViewModel.itemSizeSelected;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text(
                  'Price',
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
                      valueListenable: price,
                      builder: (context, value, child) {
                        return Text(
                          '$value',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: color.black,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: ValueListenableBuilder(
              valueListenable: itemSizeSelected,
              builder: (context, value, child) {
                return GestureDetector(
                  onTap: () async {
                    if (value.isNotEmpty) {
                      await cartViewModel.addCoffeeToCart(
                        idCoffee: idCoffee!,
                        price: price.value,
                        type: value,
                      );
                    } else {
                      cartViewModel.module.showToast('Not select size');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: color.redOrange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Add to Cart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
