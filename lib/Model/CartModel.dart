import 'package:flutter_beginning_app/Model/Cataloge.dart';
import 'package:flutter_beginning_app/core/Store.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogeModel _cataloge;

  // Collection of id fields store in _itemIds
  final List<int> _itemIds = [];

  // ignore: unnecessary_getters_setters
  CatalogeModel get cataloge => _cataloge;

  set cataloge(CatalogeModel newcataloge) {
    _cataloge = newcataloge;
  }

  //Get Item in the cart
  List<Item> get items => _itemIds.map((id) => _cataloge.getbyId(id)).toList();

  // Get Total price

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }
}
