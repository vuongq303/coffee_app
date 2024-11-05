import 'package:coffee_app/models/size_model.dart';

class OrderHistoryItemModel {
  final String id;
  final String image;
  final String name;
  final String description;
  final List<SizeModel> size;

  OrderHistoryItemModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.size,
  });
}
