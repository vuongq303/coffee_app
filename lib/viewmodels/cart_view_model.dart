import 'package:coffee_app/models/cart_model.dart';
import 'package:coffee_app/viewmodels/styles/my_color.dart';

class CartViewModel {
  MyColor color = MyColor();

  CartModel cartModel = CartModel(
    id: '',
    idProduct: '',
    image:
        'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
    name: '',
    description: '',
    size: '',
    quantity: 0,
  );
}
