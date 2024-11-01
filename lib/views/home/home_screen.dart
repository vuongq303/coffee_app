import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: color.gray, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 30,
            width: 30,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.window,
                color: color.gray,
                size: 14,
              ),
            ),
          ),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/avatar.jpg',
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Find the best\ncoffee for you',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              style: TextStyle(
                color: color.gray,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                hintText: 'Find Your Coffee...',
                hintStyle: TextStyle(
                  color: color.gray,
                  fontWeight: FontWeight.w500,
                  fontSize: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: color.gray.withOpacity(0.2)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: color.gray.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
