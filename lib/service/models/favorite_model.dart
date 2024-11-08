class FavoriteModel {
  final int? id;
  final String username;
  final int idCofee;
  final String? image;
  final String? name;
  final String? description;
  final double? rate;
  final String? type;
  final int? buy;
  final String? info;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'idCoffee': idCofee,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    final FavoriteModel favoriteModel = FavoriteModel(
      id: map['id'].toInt() ?? 0,
      username: map['username'] ?? "",
      idCofee: map['idCoffee'].toInt() ?? 0,
      image: map['image'] ?? "",
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      rate: map['rate'].toDouble() ?? 0,
      type: map['type'] ?? "",
      buy: map['buy'].toInt() ?? 0,
      info: map['info'] ?? "",
    );
    return favoriteModel;
  }

  FavoriteModel({
    this.id,
    required this.username,
    required this.idCofee,
    this.image,
    this.name,
    this.description,
    this.rate,
    this.type,
    this.buy,
    this.info,
  });
}
