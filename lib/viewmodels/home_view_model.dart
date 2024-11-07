import 'package:coffee_app/service/database_service.dart';
import 'package:coffee_app/service/models/coffee_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';

class HomeViewModel {
  final MyColor myColor = MyColor();
  final DatabaseService _databaseService = DatabaseService();

  ValueNotifier typeHomeSelect = ValueNotifier<int>(0);

  void changeTypeHomeSelect(int index) {
    typeHomeSelect.value = index;
  }

  Future<List<CoffeeModel>> getAllCoffeeSameType(String type) async {
    final resultAllListCoffee =
        await _databaseService.getAllCoffeeSameType(type);
    return resultAllListCoffee;
  }
}
