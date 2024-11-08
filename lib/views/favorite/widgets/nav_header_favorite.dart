import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavHeaderFavorite extends StatelessWidget {
  const NavHeaderFavorite({super.key});

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  void addFavorite() {}

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(),
        GestureDetector(
          onTap: addFavorite,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color.black,
            ),
            child: Icon(
              Icons.favorite,
              size: 15,
              color: color.redOrange,
            ),
          ),
        )
      ],
    );
  }
}
