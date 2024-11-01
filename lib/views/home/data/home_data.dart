import 'package:coffee_app/models/coffee_model.dart';

final homeDataType = [
  _Type(value: "All", click: true),
  _Type(value: "Cappuccino", click: false),
  _Type(value: "Espresso", click: false),
  _Type(value: "Americano", click: false),
  _Type(value: "Macchiato", click: false),
];

final List<CoffeeModel> coffeeList = [
  CoffeeModel(
    id: 'cappuccino_1',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s',
    name: 'Cappuccino',
    description: 'Delicious creamy cappuccino with a rich flavor.',
    price: 4.5,
    rate: 4.7,
    type: 'coffee',
  ),
  CoffeeModel(
    id: 'cappuccino_2',
    image:
        'https://storage.googleapis.com/turbo-math.appspot.com/user-assets/gzMWmegNKSUlh64nFjBAIuqhqGr2/04-23-2023/image-to-image/image-to-image__5f419cc4305219bba97ae735b799a45d_1682284222619_1_1682284234.png',
    name: 'Cappuccino',
    description: 'Classic cappuccino topped with foam art.',
    price: 4.7,
    rate: 4.8,
    type: 'coffee',
  ),
  CoffeeModel(
    id: 'cappuccino_3',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShlOyEiYXvyD5vxu5gmZsfFSsBh9mc_S_D-wBSxbWmKlWXU06MV2xvxRMnCiprMed_VVI&usqp=CAU',
    name: 'Cappuccino',
    description: 'A perfect blend of espresso, steamed milk, and foam.',
    price: 4.6,
    rate: 4.6,
    type: 'bean',
  ),
  CoffeeModel(
    id: 'cappuccino_4',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQa_JGLhdATxo_nhyAR5LptQN_WcT3XMxZDnV2hwybXst5yRP9hPHPX8snECtXwg9pOylc&usqp=CAU',
    name: 'Cappuccino',
    description: 'Rich and frothy cappuccino to start your day.',
    price: 4.8,
    rate: 4.9,
    type: 'coffee',
  ),
  CoffeeModel(
    id: 'espresso_1',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9v1xYuTbucIp3hpPOv08mEZ7UysdZn5sntshT4CViAMeadBgEcm7tWBY1Unw6TKjDPCs&usqp=CAU',
    name: 'Espresso',
    description: 'Strong and bold espresso shot.',
    price: 3.0,
    rate: 4.5,
    type: 'bean',
  ),
  CoffeeModel(
    id: 'espresso_2',
    image:
        'https://img.freepik.com/premium-photo/painting-fox-field-flowers-with-black-background-generative-ai_955884-31706.jpg?w=360',
    name: 'Espresso',
    description: 'Rich espresso with a smooth finish.',
    price: 3.2,
    rate: 4.6,
    type: 'bean',
  ),
  CoffeeModel(
    id: 'espresso_3',
    image:
        'https://cdn.pixabay.com/photo/2023/03/15/20/46/background-7855413_640.jpg',
    name: 'Espresso',
    description: 'Classic espresso for a quick caffeine boost.',
    price: 3.1,
    rate: 4.4,
    type: 'bean',
  ),
  CoffeeModel(
    id: 'espresso_4',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnPHYbLrWX3tKpmQakOGqZ5piVcurcwLcVhw0YKCpJcGI_a2Cea1iLwdpPcNU_BjviIF0&usqp=CAU',
    name: 'Espresso',
    description: 'Perfectly brewed espresso with a thick crema.',
    price: 3.3,
    rate: 4.7,
    type: 'coffee',
  ),
  CoffeeModel(
    id: 'americano_1',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDoii3YkzZzjM4v7pPYNC_rLFB9sADLzoGqv7WeCBeh9z79cqwpM1q6M2S3XGCMo7AluM&usqp=CAU',
    name: 'Americano',
    description: 'Smooth Americano with a balanced taste.',
    price: 3.5,
    rate: 4.6,
    type: 'coffee',
  ),
  CoffeeModel(
    id: 'americano_2',
    image:
        'https://static.vecteezy.com/system/resources/thumbnails/041/166/062/small/ai-generated-hawk-high-quality-image-free-photo.jpg',
    name: 'Americano',
    description: 'Rich Americano made with freshly brewed espresso.',
    price: 3.7,
    rate: 4.5,
    type: 'coffee',
  ),
  CoffeeModel(
    id: 'americano_3',
    image:
        'https://gratisography.com/wp-content/uploads/2024/01/gratisography-covered-in-confetti-800x525.jpg',
    name: 'Americano',
    description: 'Delicious Americano served hot or iced.',
    price: 3.6,
    rate: 4.4,
    type: 'bean',
  ),
  CoffeeModel(
    id: 'americano_4',
    image:
        'https://gratisography.com/wp-content/uploads/2024/03/gratisography-vr-glasses-800x525.jpg',
    name: 'Americano',
    description: 'Classic Americano with a deep coffee flavor.',
    price: 3.8,
    rate: 4.8,
    type: 'coffee',
  ),
  CoffeeModel(
    id: 'macchiato_1',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT1o2BgdUq_W0BS_db_6y3Ro0wQ0AYLfxsfwg&s',
    name: 'Macchiato',
    description: 'Strong macchiato with a touch of milk.',
    price: 4.0,
    rate: 4.7,
    type: 'bean',
  ),
  CoffeeModel(
    id: 'macchiato_2',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOc91IOdtyNQa6CuCp5TIqUH89hKafBaDf6g&s',
    name: 'Macchiato',
    description: 'Classic macchiato served with espresso and foam.',
    price: 4.2,
    rate: 4.8,
    type: 'coffee',
  ),
  CoffeeModel(
    id: 'macchiato_3',
    image: 'https://d38b044pevnwc9.cloudfront.net/cutout-nuxt/enhancer/2.jpg',
    name: 'Macchiato',
    description: 'Rich espresso with a hint of steamed milk.',
    price: 4.1,
    rate: 4.6,
    type: 'coffee',
  ),
  CoffeeModel(
    id: 'macchiato_4',
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFvZIhuJTPx3n3B97I_b57L3tPKnKJr7-epYrTRc4d95VgdZEAAkElIXvOz7AVwv3vXik&usqp=CAUg',
    name: 'Macchiato',
    description: 'A delightful macchiato with a smooth texture.',
    price: 4.3,
    rate: 4.9,
    type: 'bean',
  ),
];

class _Type {
  var value;
  var click;

  _Type({required this.value, required this.click});
}
