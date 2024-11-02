import 'package:coffee_app/viewmodels/detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './list_size_select.dart';

class InformationBottomDetail extends StatelessWidget {
  const InformationBottomDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final detailViewModel = context.read<DetailViewModel>();
    final item = detailViewModel.coffeeModel;
    final color = detailViewModel.color;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 16,
              color: color.gray,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            item.description,
            style: TextStyle(
              color: color.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          Text(
            'Size',
            style: TextStyle(
              fontSize: 16,
              color: color.gray,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          const ListSizeSelect(),
        ],
      ),
    );
  }
}
