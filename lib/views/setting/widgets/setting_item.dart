import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingItem extends StatelessWidget {
  const SettingItem(
      {super.key,
      required this.content,
      required this.icon,
      required this.onClick});
  final String content;
  final IconData icon;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: color.redOrange.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 15,
                    color: color.redOrange,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  content,
                  style: TextStyle(
                    color: color.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
