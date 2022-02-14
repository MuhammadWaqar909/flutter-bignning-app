import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beginning_app/core/Store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Model/CartModel.dart';
import '../Model/Cataloge.dart';

class AddItemButton extends StatelessWidget {
  final Item cataloge;
  AddItemButton({
    Key? key,
    required this.cataloge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.events.listen((event) {
      to:
      [AddMutation];
    });
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isAdd = _cart.items.contains(cataloge) ? true : false;
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)))),
        onPressed: () {
          if (!isAdd) {
            isAdd = isAdd.toggle();
            final _cataloge = CatalogeModel();
            _cart.cataloge = _cataloge;
            AddMutation(cataloge);
            print("pressed 1" + "1");
          }
        },
        child: isAdd ? Icon(Icons.done) : Icon(CupertinoIcons.cart_fill));
  }
}
