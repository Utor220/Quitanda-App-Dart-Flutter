import 'package:quitanda_app/src/models/item_model.dart';

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
