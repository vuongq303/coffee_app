import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderLogin extends StatelessWidget {
  final String content;
  const HeaderLogin({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();
    return Column(
      children: [
        Image.asset('assets/images/logo.png'),
        const SizedBox(height: 30),
        const Text(
          'Welcome to Lungo !!',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: color.gray,
          ),
        ),
      ],
    );
  }
}
