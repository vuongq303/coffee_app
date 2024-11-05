import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:coffee_app/views/history/data/history_data.dart';
import 'package:coffee_app/views/history/widgets/item_order_history.dart';
import 'package:coffee_app/widgets/header_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.read<MyColor>();

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: HeaderNavigation(color: color, title: 'Order History')),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemCount: historyListData.length,
        itemBuilder: (context, index) {
          return ItemOrderHistory(item: historyListData[index]);
        },
      ),
    );
  }
}
