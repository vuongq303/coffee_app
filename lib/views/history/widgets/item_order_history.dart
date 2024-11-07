import 'package:coffee_app/models/order_history_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/history/widgets/item_order_history_body.dart';
import 'package:coffee_app/views/history/widgets/item_order_history_top.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemOrderHistory extends StatelessWidget {
  const ItemOrderHistory({super.key, required this.item});
  final OrderHistoryModel item;

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Date',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '${item.date.day}/${item.date.month} ${item.date.hour}:${item.date.minute}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Total Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '${item.price}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: color.redOrange,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          for (final itemHistory in item.itemHistory)
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    color.black.withAlpha(200),
                    color.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ItemOrderHistoryTop(
                    color: color,
                    item: itemHistory,
                  ),
                  const SizedBox(height: 10),
                  for (final itemSize in itemHistory.size)
                    ItemOrderHistoryBody(
                      color: color,
                      item: itemSize,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
