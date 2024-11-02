import 'package:coffee_app/views/detail/widgets/bottom_detail_container.dart';
import 'package:coffee_app/views/detail/widgets/header_detail_container.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: HeaderDetailContainer(),
          ),
          Expanded(
            flex: 4,
            child: BottomDetailContainer(),
          ),
        ],
      ),
    );
  }
}
