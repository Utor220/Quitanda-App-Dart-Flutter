class ItemModel {
  String itemName;
  String imgUrl;
  String unit;
  double price;
  String description;

  ItemModel({
    required this.description,
    required this.price,
    required this.imgUrl,
    required this.itemName,
    required this.unit,
  });
}
