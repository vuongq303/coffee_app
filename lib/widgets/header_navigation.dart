import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderNavigation extends StatelessWidget {
  const HeaderNavigation({super.key, required this.color, required this.title});

  final MyColor color;
  final String title;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      leading: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            'assets/images/avatar.jpg',
            height: 35,
            width: 35,
            fit: BoxFit.cover,
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            router.push('/setting');
          },
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
            height: 35,
            width: 35,
            child: Icon(
              Icons.settings,
              color: color.gray,
              size: 16,
            ),
          ),
        ),
        const SizedBox(width: 15),
      ],
    );
  }
}
