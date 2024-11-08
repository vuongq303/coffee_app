import 'package:coffee_app/service/models/coffee_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';
import 'package:flutter/foundation.dart';

class DetailViewModel {
  MyColor color = MyColor();

  ValueNotifier itemListSizeSelect = ValueNotifier<int>(-1);
  ValueNotifier priceInDetailScreen = ValueNotifier<double>(0);

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
