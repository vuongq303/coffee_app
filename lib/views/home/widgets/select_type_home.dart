import 'package:coffee_app/viewmodels/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final homeDataType = [
  "All",
  "Cappuccino",
  "Espresso",
  "Americano",
  "Macchiato",
];

class SelectTypeHome extends StatelessWidget {
  const SelectTypeHome({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.read<HomeViewModel>();
    final color = homeViewModel.myColor;

    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeDataType.length,
        itemBuilder: (context, index) {
          final item = homeDataType[index];
          return TextButton(
            onPressed: () {
              homeViewModel.changeTypeHomeSelect(index);
            },
            child: ValueListenableBuilder(
              valueListenable: homeViewModel.typeHomeSelect,
              builder: (context, value, child) {
                return Text(
                  item,
                  style: TextStyle(
                    color: value == index ? color.redOrange : color.gray,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
