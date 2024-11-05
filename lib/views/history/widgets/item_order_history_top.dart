import 'package:coffee_app/models/order_history_item_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';

class ItemOrderHistoryTop extends StatelessWidget {
  const ItemOrderHistoryTop(
      {super.key, required this.color, required this.item});
  final MyColor color;
  final OrderHistoryItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.image,
                height: 55,
                width: 55,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            SizedBox(
              width: 125,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    item.description,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.attach_money,
              size: 25,
              color: color.redOrange,
            ),
            const Text(
              "50",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            )
          ],
        ),
        const SizedBox(),
      ],
    );
  }
}
