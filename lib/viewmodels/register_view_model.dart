import 'package:coffee_app/modules/native_module.dart';
import 'package:coffee_app/service/database_service.dart';
import 'package:coffee_app/service/models/users_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterViewModel {
  final MyColor color = MyColor();
  final DatabaseService _databaseService = DatabaseService();
  final NativeModule module = NativeModule();

  String usernameInputForm = '';
  String passwordInputForm = '';
  String rePasswordInputForm = '';

  void onSaveUsernameInputForm(String? value) {
    usernameInputForm = value!;
  }

  void onSavePasswordInputForm(String? value) {
    passwordInputForm = value!;
  }

  void onSaveRePasswordInputForm(String? value) {
    rePasswordInputForm = value!;
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

  String? onVaidatorRePasswordInputForm(String? value) {
    if (value == "") {
      return "Re-Password empty!";
    }
    return null;
  }

  void goToSignIn(GoRouter router) {
    router.pop();
  }

  Future<void> onSubmitFormRegister(GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      key.currentState!.save();

      if (passwordInputForm != rePasswordInputForm) {
        module.showToast('Re-Password not match');
        return;
      }

      final user =
          UsersModel(username: usernameInputForm, password: passwordInputForm);
      final result = await _databaseService.insertUser(user);

      if (result) {
        module.showToast('Register complete');
      } else {
        module.showToast('User exist');
      }
    }
  }
}
