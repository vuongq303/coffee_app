import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/material.dart';

class HomeViewModel {
  MyColor myColor = MyColor();
  ValueNotifier typeHomeSelect = ValueNotifier<int>(0);

  void changeTypeHomeSelect(int index) {
    typeHomeSelect.value = index;
  }
}
