import 'package:coffee_app/viewmodels/detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBottomDetail extends StatelessWidget {
  const NavBottomDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final detailViewModel = context.read<DetailViewModel>();
    final item = detailViewModel.coffeeModel;
    final color = detailViewModel.color;

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
                    Text(
                      "4",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: color.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: GestureDetector(
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
            ),
          )
        ],
      ),
    );
  }
}
