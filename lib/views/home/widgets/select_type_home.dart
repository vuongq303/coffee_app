import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/home/data/home_data.dart';
import 'package:flutter/material.dart';

class SelectTypeHome extends StatefulWidget {
  const SelectTypeHome({super.key, required this.color});
  final MyColor color;

  @override
  State<SelectTypeHome> createState() => _SelectTypeHomeState();
}

class _SelectTypeHomeState extends State<SelectTypeHome> {
  var itemClick = homeDataType.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeDataType.length,
        itemBuilder: (context, index) {
          final item = homeDataType[index];
          return TextButton(
            onPressed: () {
              setState(() {
                homeDataType[homeDataType.indexOf(itemClick)].click = false;
                itemClick = item;
                homeDataType[homeDataType.indexOf(itemClick)].click = true;
              });
            },
            child: Text(
              key: ValueKey(item.value),
              item.value,
              style: TextStyle(
                color: item.click ? widget.color.redOrange : widget.color.gray,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        },
      ),
    );
  }
}
