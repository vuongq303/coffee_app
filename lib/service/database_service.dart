import 'package:coffee_app/service/models/users_model.dart';

import './models/coffee_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._();
  factory DatabaseService() => _databaseService;
  DatabaseService._();

  final String coffee = "coffee";
  final String idCoffee = "id";
  final String idSizeCoffee = "idSize";
  final String imageCoffee = "image";
  final String nameCoffee = "name";
  final String descriptionCoffee = "description";
  final String rateCoffee = "rate";
  final String typeCoffee = "type";
  final String buyCoffee = "buy";
  final String infoCoffee = "info";

  final String size = "size";
  final String idSize = "id";
  final String typeSize = "type";
  final String priceSize = "price";
  final String quantitySize = "quantity";

  final String users = 'users';
  final String idUsers = 'id';
  final String usernameUsers = 'username';
  final String passwordUsers = 'password';

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
      $idCoffee INTEGER PRIMARY KEY AUTOINCREMENT,
      $idSizeCoffee integer,
      $imageCoffee TEXT,
      $nameCoffee text,
      $descriptionCoffee text,
      $rateCoffee float,
      $typeCoffee text,
      $buyCoffee integer,
      $infoCoffee text
    )''');

    await db.execute('''
      CREATE TABLE $size(
      $idSize INTEGER PRIMARY KEY AUTOINCREMENT,
      $typeSize TEXT,
      $priceSize float,
      $quantitySize INTEGER
    )''');

    await db.execute('''
      create table $users(
      $idUsers INTEGER PRIMARY KEY AUTOINCREMENT,
      $usernameUsers text,
      $passwordUsers text
      )''');

    await db.execute('''
      INSERT INTO $coffee(
      $idCoffee,
      $idSizeCoffee,
      $imageCoffee,
      $nameCoffee,
      $descriptionCoffee,
      $rateCoffee,
      $typeCoffee,
      $buyCoffee,
      $infoCoffee)
      VALUES
      (1, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s', 'Espresso', 'A strong, concentrated coffee', 3.5, 'bean', 100, 'Rich and bold flavor'),
      (2, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s', 'Cappuccino', 'Espresso with steamed milk and foam', 4.0, 'coffee', 150, 'Creamy and frothy'),
      (3, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s', 'Latte', 'Espresso with steamed milk', 4.5, 'bean', 200, 'Smooth and velvety'),
      (4, 1,'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s', 'Americano', 'Espresso diluted with hot water', 3.0, 'coffee', 120, 'Clean and simple');
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

    final List<Map<String, dynamic>> coffees =
        await db.query(coffee, where: "$typeCoffee = ?", whereArgs: [type]);

    final listCoffees = coffees
        .map(
          (coffee) => CoffeeModel.fromMap(coffee),
        )
        .toList();

    return listCoffees;
  }
}
