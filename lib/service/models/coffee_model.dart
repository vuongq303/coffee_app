import 'dart:convert';

import './size_model.dart';

class CoffeeModel {
  final int? id;
  final String image;
  final String name;
  final String description;
  final double rate;
  final String type;
  final int buy;
  final String info;
  final List<SizeModel> size;

  CoffeeModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.rate,
    required this.type,
    required this.buy,
    required this.info,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'size': size,
      'image': image,
      'name': name,
      'description': description,
      'rate': rate,
      'type': type,
      'buy': buy,
      'info': info,
    };
  }

  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    List<SizeModel> listSizeModel = [];

    for (var itemSize in json.decode(map['size'])) {
      listSizeModel.add(SizeModel.fromMap(itemSize));
    }

    final CoffeeModel coffeeModel = CoffeeModel(
      id: map['id'].toInt() ?? 0,
      size: listSizeModel,
      image: map["image"] ?? "",
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      rate: map['rate'].toDouble() ?? 0.0,
      type: map['type'] ?? "",
      buy: map['buy'].toInt() ?? 0,
      info: map['info'] ?? "",
    );
    return coffeeModel;
  }
}
