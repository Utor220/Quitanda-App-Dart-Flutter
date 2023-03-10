import 'package:quitanda_app/src/models/cart_item_model.dart';
import 'package:quitanda_app/src/models/item_model.dart';
import 'package:quitanda_app/src/models/order_model.dart';
import 'package:quitanda_app/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description: 'Maçã Red fresquinha',
  price: 15.99,
  imgUrl: 'assets/fruits/maca_redpng.png',
  itemName: 'Maçã Red',
  unit: 'kg',
);
ItemModel grape = ItemModel(
  description: 'Uva Vitória fresquinha',
  price: 11.59,
  imgUrl: 'assets/fruits/uva_vitoria.png',
  itemName: 'Uva Vitória',
  unit: 'un',
);
ItemModel guava = ItemModel(
  description: 'Goiaba fresquinha',
  price: 3.61,
  imgUrl: 'assets/fruits/goiaba.png',
  itemName: 'Goiaba',
  unit: 'kg',
);
ItemModel kiwi = ItemModel(
  description: 'Kiwi fresquinha',
  price: 8.23,
  imgUrl: 'assets/fruits/kiwipng.png',
  itemName: 'Kiwi',
  unit: 'kg',
);
ItemModel mango = ItemModel(
  description: 'Manga fresquinha',
  price: 6.87,
  imgUrl: 'assets/fruits/manga.png',
  itemName: 'Manga',
  unit: 'kg',
);
ItemModel papaya = ItemModel(
  description: 'Mamão Papaya fresquinho',
  price: 5.45,
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão Papaya',
  unit: 'kg',
);

List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 1,
  ),
  CartItemModel(
    item: mango,
    quantity: 1,
  ),
  CartItemModel(
    item: guava,
    quantity: 3,
  ),
];

UserModel user = UserModel(
  name: 'Victor',
  email: 'victor.muramatsu@gmail.com',
  phone: '11 9 8906-9225',
  cpf: '516.909.658-51',
  password: '',
);

List<OrderModel> orders = [
  //Pedido 01
  OrderModel(
    copyAndPaste: '1289wdfssdf',
    createdDateTime: DateTime.parse('2022-11-09 16:48:15.600'),
    overdueDateTime: DateTime.parse('2023-11-10 16:48:15.600'),
    id: '8912mkasd',
    status: 'pending_payment',
    total: 31.98,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 3,
      ),
    ],
  ),

  //Pedido 02
  OrderModel(
    copyAndPaste: '1289wdfssdfup1',
    createdDateTime: DateTime.parse('2022-11-09 16:48:15.600'),
    overdueDateTime: DateTime.parse('2023-11-10 16:48:15.600'),
    id: '8919swk2mkasd',
    status: 'delivered',
    total: 15.99,
    items: [
      CartItemModel(
        item: apple,
        quantity: 1,
      ),
    ],
  ),
];
