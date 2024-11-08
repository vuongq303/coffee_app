class FavoriteModel {
  final int? id;
  final String username;
  final int idCofee;

  FavoriteModel({
    this.id,
    required this.username,
    required this.idCofee,
  });
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
    );
    return favoriteModel;
  }
}
