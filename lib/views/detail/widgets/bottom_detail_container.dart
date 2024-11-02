import 'package:flutter/material.dart';

import './bottom/information_bottom_detail.dart';
import './bottom/nav_bottom_detail.dart';

class BottomDetailContainer extends StatelessWidget {
  const BottomDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InformationBottomDetail(),
        NavBottomDetail(),
      ],
    );
  }
}
