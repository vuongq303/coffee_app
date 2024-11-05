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
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                color.black.withAlpha(200),
                color.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          height: 30,
          width: 30,
          padding: const EdgeInsets.only(left: 2),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: color.gray,
              size: 14,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: color.gray, width: 0.5),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                color.black.withAlpha(200),
                color.black,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          height: 30,
          width: 30,
          child: IconButton(
            onPressed: addFavorite,
            icon: Icon(
              Icons.favorite,
              color: color.redOrange,
              size: 14,
            ),
          ),
        ),
      ],
    );
  }
}
