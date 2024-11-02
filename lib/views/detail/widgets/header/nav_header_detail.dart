import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavHeaderDetail extends StatelessWidget {
  const NavHeaderDetail({super.key});

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
        GestureDetector(
          onTap: () {
            goBack(context);
          },
          child: Container(
            padding:
                const EdgeInsets.only(left: 14, right: 7, top: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color.black,
            ),
            child: Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: color.gray,
            ),
          ),
        ),
        GestureDetector(
          onTap: addFavorite,
          child: Container(
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
