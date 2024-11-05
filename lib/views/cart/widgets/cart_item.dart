import 'package:coffee_app/models/cart_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItem});
  final CartModel cartItem;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  var _quantityCount = 1;

  void increaseQuantityCount() {
    _quantityCount++;
    setState(() {});
  }

  void decreaseQuantityCount() {
    if (_quantityCount > 1) {
      _quantityCount--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color.black.withAlpha(200),
            color.black,
          ],
        ),
      ),
      height: 160,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.cartItem.image,
                  fit: BoxFit.cover,
                  height: 130,
                  width: 130,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cartItem.name,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        widget.cartItem.description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 70,
                      decoration: BoxDecoration(
                        color: color.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          widget.cartItem.size,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          size: 15,
                          color: color.redOrange,
                        ),
                        Text(
                          "${widget.cartItem.price}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(),
                  ],
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: decreaseQuantityCount,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: color.redOrange,
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 50,
                      height: 25,
                      decoration: BoxDecoration(
                        color: color.black,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: color.redOrange,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$_quantityCount',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    InkWell(
                      onTap: increaseQuantityCount,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: color.redOrange,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
