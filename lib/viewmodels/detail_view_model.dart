import 'package:coffee_app/models/coffee_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';

class DetailViewModel {
  MyColor color = MyColor();
  CoffeeModel coffeeModel = CoffeeModel(
    id: "",
    image:
        "https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp",
    name: '',
    description: '',
    price: 0,
    rate: 0,
    type: 'bean',
  );

  void setItemDetail(CoffeeModel coffeeItem) {
    coffeeModel = coffeeItem;
  }
}
