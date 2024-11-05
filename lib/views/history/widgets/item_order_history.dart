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
      height: 270.0 * item.itemHistory.length,
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
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: item.itemHistory.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 225,
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color.black.withAlpha(200), color.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ItemOrderHistoryTop(
                          color: color,
                          item: item.itemHistory[index],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        flex: 7,
                        child: ItemOrderHistoryBody(
                          color: color,
                          item: item.itemHistory[index],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
