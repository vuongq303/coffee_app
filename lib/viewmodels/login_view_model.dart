import 'package:coffee_app/modules/native_module.dart';
import 'package:coffee_app/service/database_service.dart';
import 'package:coffee_app/service/models/users_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel {
  final MyColor color = MyColor();
  final DatabaseService _databaseService = DatabaseService();
  final NativeModule module = NativeModule();
  final logger = Logger();

  String usernameInputForm = '';
  String passwordInputForm = '';

  void onSaveUsernameInputForm(String? value) {
    usernameInputForm = value!;
  }

  void onSavePasswordInputForm(String? value) {
    passwordInputForm = value!;
  }

  String? onVaidatorUsernameInputForm(String? value) {
    if (value == "") {
      return "Username empty!";
    }
    return null;
  }

  String? onVaidatorPasswordInputForm(String? value) {
    if (value == "") {
      return "Password empty!";
    }
    return null;
  }

  void goToRegister(GoRouter router) {
    router.go('/register');
  }

  Future<void> onSubmitFormLogin(
      GlobalKey<FormState> key, GoRouter router) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    if (key.currentState!.validate()) {
      key.currentState!.save();

      final user =
          UsersModel(username: usernameInputForm, password: passwordInputForm);
      final userQuery = await _databaseService.getUser(user);

      if (userQuery != null) {
        await sharedPreferences.setString(
          'usernameOfUser',
          usernameInputForm,
        );
        router.go('/home');

        return;
      }
      module.showToast('Username or password incorrect!');
    }
  }
}
