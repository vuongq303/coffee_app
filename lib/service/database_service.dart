import 'package:coffee_app/service/models/favorite_model.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import './models/users_model.dart';
import './models/coffee_model.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._();
  factory DatabaseService() => _databaseService;
  DatabaseService._();
  final logger = Logger();

  final String coffee = "coffee";
  final String idCoffee = "id";
  final String imageCoffee = "image";
  final String nameCoffee = "name";
  final String descriptionCoffee = "description";
  final String rateCoffee = "rate";
  final String typeCoffee = "type";
  final String buyCoffee = "buy";
  final String infoCoffee = "info";

  final String size = "size";
  final String typeSize = "type";
  final String priceSize = "price";
  final String quantitySize = "quantity";

  final String users = "users";
  final String idUsers = "id";
  final String usernameUsers = "username";
  final String passwordUsers = "password";

  final String favorites = "favorites";
  final String idFavorite = "id";
  final String usernameUsersFavorite = "username";
  final String idCoffeeFavorite = "idCoffee";

  final String carts = "cart";
  final String idCart = "id";
  final String usernameUsersCart = "username";
  final String idCoffeeCart = "idCoffee";

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'flutter_sqflite_database.db');

    return await openDatabase(path, onCreate: _onCreate, version: 1);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $coffee(
      $idCoffee INTEGER PRIMARY KEY,
      $imageCoffee TEXT,
      $nameCoffee text,
      $descriptionCoffee text,
      $rateCoffee float,
      $typeCoffee text,
      $buyCoffee integer,
      $infoCoffee text,
      $size text
    )''');

    await db.execute('''
      create table $users(
      $idUsers INTEGER PRIMARY KEY AUTOINCREMENT,
      $usernameUsers text,
      $passwordUsers text
    )''');

    await db.execute('''
      create table $favorites(
      $idFavorite INTEGER primary key autoincrement,
      $usernameUsersFavorite text,
      $idCoffeeFavorite INTEGER
    )''');

    await db.execute('''
      create table $carts(
      $idCart INTEGER primary key autoincrement,
      $usernameUsersCart text,
      $idCoffeeCart INTEGER
    )''');

    await db.execute('''
      INSERT INTO $coffee(
      $idCoffee,
      $imageCoffee,
      $nameCoffee,
      $descriptionCoffee,
      $rateCoffee,
      $typeCoffee,
      $buyCoffee,
      $infoCoffee,
      $size )
      VALUES
      (1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s', 'Espresso', 'A strong, concentrated coffee', 3.5, 'bean', 100, 'Rich and bold flavor',
      '[{"id": 1,"$typeSize": "250 gam","$priceSize": 3.5, "$quantitySize": 10},
      {"id": 2,"$typeSize": "350 gam", "$priceSize": 3.4, "$quantitySize": 12},
      {"id": 3,"$typeSize": "450 gam", "$priceSize": 3.1,"$quantitySize": 15}]'),
      (2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s', 'Cappuccino', 'Espresso with steamed milk and foam', 4.0, 'coffee', 150, 'Creamy and frothy',
      '[{"id": 1,"$typeSize": "S", "$priceSize": 3.6, "$quantitySize": 17},
      {"id": 2,"$typeSize": "M", "$priceSize": 3.8, "$quantitySize": 10},
      {"id": 3,"$typeSize": "L", "$priceSize": 3.0, "$quantitySize": 11}]')
    ''');
  }

  Future<bool> insertUser(UsersModel user) async {
    final db = await _databaseService.database;

    final checkUserExist =
        await findUserByUsername(username: user.username, db: db);

    if (checkUserExist) {
      await db.insert(users, user.toMap());
      return true;
    }

    return false;
  }

  Future<bool> findUserByUsername(
      {required String username, required Database db}) async {
    final userQuery = await db.query(
      users,
      where: '$usernameUsers = ?',
      whereArgs: [username],
    );

    if (userQuery.isEmpty) {
      return true;
    }

    return false;
  }

  Future<UsersModel?> getUser(UsersModel user) async {
    final db = await _databaseService.database;

    final userQuery = await db.query(
      users,
      where: '$usernameUsers = ? and $passwordUsers = ?',
      whereArgs: [user.username, user.password],
    );

    if (userQuery.isNotEmpty) {
      final user = UsersModel.fromMap(userQuery.first);
      return user;
    }

    return null;
  }

  Future<List<CoffeeModel>> getAllCoffeeSameType(String type) async {
    final db = await _databaseService.database;

    List<Map<String, dynamic>> coffeesQuery = await db.query(
      coffee,
      where: '$typeCoffee = ?',
      whereArgs: [type],
    );

    List<CoffeeModel> coffees = coffeesQuery.map((itemCoffee) {
      return CoffeeModel.fromMap(itemCoffee);
    }).toList();

    return coffees;
  }

  Future<bool> findFavoriteById(
      {required String username, required int idCoffee}) async {
    final db = await _databaseService.database;
    final favoriteQuery = await db.query(
      favorites,
      where: '$idCoffeeFavorite = ? and $usernameUsersFavorite = ?',
      whereArgs: [idCoffee, username],
    );
    if (favoriteQuery.isEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> addCoffeeToFavorite(FavoriteModel favorite) async {
    final db = await _databaseService.database;
    final checkFavoriteExist = await findFavoriteById(
      username: favorite.username,
      idCoffee: favorite.idCofee,
    );

    if (checkFavoriteExist) {
      await db.insert(favorites, favorite.toMap());
      return true;
    }
    return false;
  }

  Future<List<FavoriteModel>> getAllListFavorite(
      {required String username}) async {
    final db = await _databaseService.database;

    final listFavoriteQuery = await db.rawQuery('''
     SELECT *
    FROM $coffee
    INNER JOIN $favorites ON
    $coffee.$idCoffee = $favorites.$idCoffeeFavorite;
    ''');

    final listFavorite = listFavoriteQuery
        .map(
          (favorite) => FavoriteModel.fromMap(favorite),
        )
        .toList();

    return listFavorite;
  }

  Future<bool> deleteCoffeeFromFavorite(FavoriteModel favorite) async {
    final db = await _databaseService.database;
    final resultDeleteCoffee = await db.delete(
      favorites,
      where: '$idCoffeeFavorite = ? and $usernameUsersFavorite = ?',
      whereArgs: [favorite.idCofee, favorite.username],
    );

    if (resultDeleteCoffee > 0) {
      return true;
    }

    return false;
  }
}
