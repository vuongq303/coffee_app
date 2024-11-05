import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderNavigationCustomBack extends StatelessWidget {
  const HeaderNavigationCustomBack({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: TextStyle(
          color: color.black,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      leading: Center(
        child: Container(
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
      ),
    );
  }
}
