import 'package:coffee_app/models/coffee_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';

class ItemCoffee extends StatelessWidget {
  const ItemCoffee({super.key, required this.itemCoffee, required this.color});
  final CoffeeModel itemCoffee;
  final MyColor color;

  static const _gap = 15.0;
  static const _radius = 20.0;
  static const _iconSize = 10.0;
  static const _opacity = 0.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_gap),
      margin: const EdgeInsets.only(right: _gap),
      width: 150,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(_opacity),
        borderRadius: BorderRadius.circular(_radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(_radius),
                  child: Image.network(
                    itemCoffee.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: _gap - 5,
                      vertical: _gap / 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(_opacity - 0.1),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(_radius + 6),
                        topRight: Radius.circular(_radius + 3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: _iconSize,
                          color: color.redOrange,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${itemCoffee.rate}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _space,
                Text(
                  itemCoffee.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                _space,
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  itemCoffee.description,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                _space,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: _iconSize + 5,
                          color: color.redOrange,
                        ),
                        Text(
                          "${itemCoffee.price}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: color.redOrange,
                        borderRadius: BorderRadius.circular(_radius / 2),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          size: _iconSize,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final _space = const SizedBox(height: 10);
}
