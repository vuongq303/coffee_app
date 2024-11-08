class SizeModel {
  final int? id;
  final String type;
  final double price;
  final int quantity;

  SizeModel({
    this.id,
    required this.type,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'price': price,
      'quantity': quantity,
    };
  }

  factory SizeModel.fromMap(Map<String, dynamic> map) {
    final SizeModel sizeModel = SizeModel(
        id: map['id'].toInt() ?? 0,
        type: map['type'] ?? "",
        price: map['price'].toDouble() ?? 0.0,
        quantity: map['quantity'].toInt() ?? 0);
    return sizeModel;
  }
}
