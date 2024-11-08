import 'package:coffee_app/modules/native_module.dart';
import 'package:coffee_app/service/database_service.dart';
import 'package:coffee_app/service/models/favorite_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteViewModel {
  final MyColor color = MyColor();
  final DatabaseService _databaseService = DatabaseService();
  NativeModule nativeModule = NativeModule();
  final logger = Logger();

  Future<void> addCoffeeToFavorite({required int idCofee}) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final FavoriteModel favoriteModel = FavoriteModel(
      username: sharedPreferences.getString('usernameOfUser') ?? "",
      idCofee: idCofee,
    );

    final resultAddCoffee =
        await _databaseService.addCoffeeToFavorite(favoriteModel);
    if (resultAddCoffee) {
      nativeModule.showToast('Add to favorite complete!');
    } else {
      nativeModule.showToast('Add to favorite fail');
    }
  }

  Future<void> removeCoffeeToFavorite({required int idCofee}) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final FavoriteModel favoriteModel = FavoriteModel(
      username: sharedPreferences.getString('usernameOfUser') ?? "",
      idCofee: idCofee,
    );

    final resultDeleteCoffee =
        await _databaseService.addCoffeeToFavorite(favoriteModel);

    if (resultDeleteCoffee) {
      nativeModule.showToast('Remove to favorite complete!');
    } else {
      nativeModule.showToast('Remove to favorite fail');
    }
  }

  void backToHomeScreen(BuildContext context) {
    Navigator.pop(context);
  }

  Future<List<FavoriteModel>> get listFavorite async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final listFavorite = await _databaseService.getAllListFavorite(
        username: sharedPreferences.getString('usernameOfUser') ?? "");

    return listFavorite;
  }
}
