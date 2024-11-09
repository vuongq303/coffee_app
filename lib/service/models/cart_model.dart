class CartModel {
  final int? id;
  final String username;
  final int idCoffee;
  final double price;
  final String type;
  final String? image;
  final String? name;
  final String? description;

  CartModel({
    this.id,
    required this.username,
    required this.idCoffee,
    required this.price,
    required this.type,
    this.image,
    this.name,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'idCoffee': idCoffee,
      'price': price,
      'type': type,
    };
  }

  factory CartModel.toMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'].toInt() ?? 0,
      username: map['username'] ?? "",
      idCoffee: map['idCoffee'].toInt() ?? 0,
      price: map['price'].toDouble() ?? 0,
      type: map['type'] ?? "",
      image: map['image'] ?? "",
      name: map['name'] ?? "",
      description: map['description'] ?? "",
    );
  }
}
