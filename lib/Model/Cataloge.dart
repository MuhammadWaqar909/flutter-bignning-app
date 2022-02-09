class CatalogeModel {
  static final item = [
    Item(
      id: 1234,
      name: "Iphone 12 Pro Max",
      desc: "Apple Iphone 12th generation",
      price: 999,
      color: "#33505a",
      image:
          "https://img.zab.ee/product/thumbs/75a0993e5dd332ad013fd75eac2d7224_thumb.jpg",
    )
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
