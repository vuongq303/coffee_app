import 'package:coffee_app/models/order_history_item_model.dart';
import 'package:coffee_app/models/order_history_model.dart';
import 'package:coffee_app/models/size_model.dart';

List<OrderHistoryModel> historyListData = [
  OrderHistoryModel(
    id: '1',
    price: 15,
    itemHistory: [
      OrderHistoryItemModel(
        id: '1',
        image:
            'https://storage.googleapis.com/turbo-math.appspot.com/user-assets/gzMWmegNKSUlh64nFjBAIuqhqGr2/04-23-2023/image-to-image/image-to-image__5f419cc4305219bba97ae735b799a45d_1682284222619_1_1682284234.png',
        name: 'Cappuccino',
        description: 'Classic cappuccino topped with foam art.',
        size: [
          SizeModel(
            id: '1',
            size: '250 gam',
            price: 6.5,
            quantity: 3,
          ),
          SizeModel(
            id: '2',
            size: '250 gam',
            price: 6.5,
            quantity: 3,
          ),
        ],
      ),
      OrderHistoryItemModel(
        id: '2',
        image:
            'https://storage.googleapis.com/turbo-math.appspot.com/user-assets/gzMWmegNKSUlh64nFjBAIuqhqGr2/04-23-2023/image-to-image/image-to-image__5f419cc4305219bba97ae735b799a45d_1682284222619_1_1682284234.png',
        name: 'Cappuccino',
        description: 'Classic cappuccino topped with foam art.',
        size: [
          SizeModel(
            id: '2',
            size: '250 gam',
            price: 6.5,
            quantity: 3,
          ),
          SizeModel(
            id: '3',
            size: '250 gam',
            price: 6.5,
            quantity: 3,
          ),
          SizeModel(
            id: '4',
            size: '250 gam',
            price: 6.5,
            quantity: 3,
          ),
        ],
      ),
    ],
  ),
  OrderHistoryModel(
    id: '2',
    price: 15,
    itemHistory: [
      OrderHistoryItemModel(
        id: '2',
        image:
            'https://storage.googleapis.com/turbo-math.appspot.com/user-assets/gzMWmegNKSUlh64nFjBAIuqhqGr2/04-23-2023/image-to-image/image-to-image__5f419cc4305219bba97ae735b799a45d_1682284222619_1_1682284234.png',
        name: 'Cappuccino',
        description: 'Classic cappuccino topped with foam art.',
        size: [
          SizeModel(
            id: '2',
            size: '250 gam',
            price: 6.5,
            quantity: 3,
          ),
          SizeModel(
            id: '3',
            size: '250 gam',
            price: 6.5,
            quantity: 3,
          ),
        ],
      ),
      OrderHistoryItemModel(
        id: '3',
        image:
            'https://storage.googleapis.com/turbo-math.appspot.com/user-assets/gzMWmegNKSUlh64nFjBAIuqhqGr2/04-23-2023/image-to-image/image-to-image__5f419cc4305219bba97ae735b799a45d_1682284222619_1_1682284234.png',
        name: 'Cappuccino',
        description: 'Classic cappuccino topped with foam art.',
        size: [
          SizeModel(
            id: '3',
            size: '450 gam',
            price: 6.9,
            quantity: 6,
          ),
          SizeModel(
            id: '4',
            size: '450 gam',
            price: 6.9,
            quantity: 6,
          ),
        ],
      ),
    ],
  ),
  OrderHistoryModel(
    id: '3',
    price: 25,
    itemHistory: [
      OrderHistoryItemModel(
        id: '2',
        image:
            'https://storage.googleapis.com/turbo-math.appspot.com/user-assets/gzMWmegNKSUlh64nFjBAIuqhqGr2/04-23-2023/image-to-image/image-to-image__5f419cc4305219bba97ae735b799a45d_1682284222619_1_1682284234.png',
        name: 'Cappuccino',
        description: 'Classic cappuccino topped with foam art.',
        size: [
          SizeModel(
            id: '2',
            size: '250 gam',
            price: 6.5,
            quantity: 3,
          ),
          SizeModel(
            id: '3',
            size: '250 gam',
            price: 6.5,
            quantity: 3,
          ),
        ],
      ),
    ],
  )
];
