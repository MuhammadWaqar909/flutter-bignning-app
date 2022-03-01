class CatalogeModel {
  static List<Item> item = [];

  Item getbyId(int id) =>
      item.firstWhere((element) => element.id == id, orElse: null);
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      price: map["price"],
      desc: map["desc"],
      image: map["image"],
    );
    // factory Item.fromMap(Map<String, dynamic> map) {
    //   return Item(
    //     id: map["id"],
    //     name: map["name"],
    //     price: map["price"],
    //     color: map["color"],
    //     desc: map["desc"],
    //     image: map["image"],
    //   );
  }

  // for import map data
  // below line is class to map opposite to uper class
  toMap() => {
        "id": id,
        "name": name,
        "price": price,
        "desc": desc,
        "image": image,
      };
}
