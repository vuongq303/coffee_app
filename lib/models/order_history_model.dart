import 'package:coffee_app/models/order_history_item_model.dart';

class OrderHistoryModel {
  final String id;
  final double price;
  final DateTime date = DateTime.now();
  final List<OrderHistoryItemModel> itemHistory;

  OrderHistoryModel({
    required this.id,
    required this.itemHistory,
    required this.price,
  });
}
