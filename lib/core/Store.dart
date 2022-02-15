import 'package:flutter_beginning_app/Model/CartModel.dart';
import 'package:flutter_beginning_app/Model/Cataloge.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogeModel cataloge;
  late CartModel cart;

  MyStore() {
    cart = CartModel();
    cataloge = CatalogeModel();
    cart.cataloge = cataloge;
  }
}
