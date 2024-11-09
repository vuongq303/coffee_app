import 'package:coffee_app/modules/native_module.dart';
import 'package:coffee_app/service/database_service.dart';
import 'package:coffee_app/service/models/cart_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartViewModel {
  MyColor color = MyColor();
  final DatabaseService _databaseService = DatabaseService();
  NativeModule module = NativeModule();
  ValueNotifier<double> totalPriceInCart = ValueNotifier<double>(0.0);

  Future<List<CartModel>> get allListCart async {
    var totalPrice = 0.0;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final listCarts = await _databaseService.getAllListCart(
      username: sharedPreferences.getString('usernameOfUser') ?? "",
    );

    for (var cart in listCarts) {
      totalPrice += cart.price;
    }

    totalPriceInCart.value = totalPrice;
    return listCarts;
  }

  Future<void> addCoffeeToCart({
    required int idCoffee,
    required double price,
    required String type,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final CartModel cart = CartModel(
      username: sharedPreferences.getString('usernameOfUser') ?? "",
      idCoffee: idCoffee,
      price: price,
      type: type,
    );

    final statusAddCoffeeToCart = await _databaseService.addCoffeeToCart(cart);
    if (statusAddCoffeeToCart) {
      module.showToast('Add coffee to cart complete!');
    } else {
      module.showToast('Add coffee to cart failed');
    }
  }
}
