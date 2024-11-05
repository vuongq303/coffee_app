import 'package:coffee_app/models/order_history_item_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';

class ItemOrderHistoryBody extends StatelessWidget {
  const ItemOrderHistoryBody(
      {super.key, required this.color, required this.item});
  final MyColor color;
  final OrderHistoryItemModel item;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: item.size.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: color.black,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    width: 80,
                    height: 35,
                    child: Center(
                      child: Text(
                        item.size[index].size,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 35,
                    color: color.grayLight.withAlpha(200),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: color.black,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    width: 80,
                    height: 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 20,
                          color: color.redOrange,
                        ),
                        const Text(
                          "50",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.close,
                    size: 20,
                    color: color.redOrange,
                  ),
                  Text(
                    "${item.size[index].quantity}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Text(
                "50",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: color.redOrange,
                ),
              ),
              const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
