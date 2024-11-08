import 'package:coffee_app/service/models/size_model.dart';
import 'package:coffee_app/viewmodels/detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class ListSizeSelect extends StatefulWidget {
  const ListSizeSelect({super.key});

  @override
  State<ListSizeSelect> createState() => _ListSizeSelectState();
}

class _ListSizeSelectState extends State<ListSizeSelect> {
  late final List<SizeModel> listSize;
  final logger = Logger();

  @override
  void initState() {
    super.initState();

    final detailViewModel = context.read<DetailViewModel>();
    final item = detailViewModel.coffeeModel;
    listSize = item.size;
  }

  @override
  Widget build(BuildContext context) {
    final detailViewModel = context.read<DetailViewModel>();
    final color = detailViewModel.color;

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listSize.length,
        itemBuilder: (context, index) {
          final size = listSize[index];

          return GestureDetector(
            onTap: () {
              detailViewModel.changeItemListSelect(index);
            },
            child: ValueListenableBuilder(
              valueListenable: detailViewModel.itemListSizeSelect,
              builder: (context, value, child) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: value == index
                        ? color.redOrange
                        : color.black.withAlpha(200),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      size.type,
                      style: TextStyle(
                        fontSize: 14,
                        color: value == index ? Colors.white : color.grayLight,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
