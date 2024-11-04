import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_app/viewmodels/detail_view_model.dart';

import './header/nav_header_detail.dart';
import './header/information_header_detail.dart';

class HeaderDetailContainer extends StatelessWidget {
  const HeaderDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final detailViewModel = context.read<DetailViewModel>();
    final item = detailViewModel.coffeeModel;

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          item.image,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: const NavHeaderDetail(),
              ),
              const InformationHeaderDetail(),
            ],
          ),
        ),
      ],
    );
  }
}
