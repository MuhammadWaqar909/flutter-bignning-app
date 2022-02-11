import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_beginning_app/utils/Themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Container(
            padding: EdgeInsets.only(left: 80),
            child: Text(
              "Order Cart",
              style: TextStyle(fontSize: 30, color: MyTheme.darkBluishColor),
            ),
          )),
    );
  }
}
