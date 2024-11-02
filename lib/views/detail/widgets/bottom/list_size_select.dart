import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListSizeSelect extends StatefulWidget {
  const ListSizeSelect({super.key});

  @override
  State<ListSizeSelect> createState() => _ListSizeSelectState();
}

class _ListSizeSelectState extends State<ListSizeSelect> {
  late final List<_Size> listSize;
  var itemClick = _Size(size: '', status: false);

  @override
  void initState() {
    super.initState();
    listSize = [
      _Size(size: "250gam", status: false),
      _Size(size: "500gam", status: false),
      _Size(size: "1000gam", status: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return Wrap(
      children: [
        for (final size in listSize)
          GestureDetector(
            onTap: () {
              if (listSize.contains(itemClick)) {
                listSize[listSize.indexOf(itemClick)].status = false;
              }
              setState(() {
                itemClick = size;
                listSize[listSize.indexOf(itemClick)].status = true;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                color:
                    size.status ? color.redOrange : color.black.withAlpha(200),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                size.size,
                style: TextStyle(
                  fontSize: 14,
                  color: size.status ? Colors.white : color.grayLight,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _Size {
  var size;
  var status;
  _Size({required this.size, required this.status});
}
