import 'package:coffee_app/service/database_service.dart';
import 'package:coffee_app/service/models/coffee_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailViewModel {
  MyColor color = MyColor();
  final DatabaseService _databaseService = DatabaseService();
  ValueNotifier itemListSizeSelect = ValueNotifier<int>(-1);
  ValueNotifier priceInDetailScreen = ValueNotifier<double>(0);
  ValueNotifier isFavorite = ValueNotifier<bool>(false);

  Future<void> checkIsFavorite({required int idCoffee}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    final checkIsFavorite = await _databaseService.findFavoriteById(
      username: sharedPreferences.getString('usernameOfUser') ?? "",
      idCoffee: idCoffee,
    );

    isFavorite.value = checkIsFavorite;
  }

  void changeIsFavorite(bool status) {
    isFavorite.value = status;
  }

  CoffeeModel coffeeModel = CoffeeModel(
    id: 0,
    size: [],
    image:
        'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
    name: '',
    description: '',
    rate: 0,
    type: 'coffee',
    buy: 0,
    info: '',
  );

  void changeItemListSelect(int index) {
    itemListSizeSelect.value = index;
    priceInDetailScreen.value = coffeeModel.size[index].price;
  }

  void setItemDetail(CoffeeModel coffeeItem) {
    itemListSizeSelect.value = -1;
    priceInDetailScreen.value = 0.0;
    coffeeModel = coffeeItem;
  }
}
