class UsersModel {
  final int? id;
  final String username;
  final String password;

  UsersModel({
    this.id,
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    final userToMap = {'id': id, 'username': username, 'password': password};
    return userToMap;
  }

  factory UsersModel.fromMap(Map<String, dynamic> map) {
    final UsersModel user = UsersModel(
      id: map['id'],
      username: map['username'],
      password: map['password'],
    );
    return user;
  }
}
