import 'package:flutter/material.dart';
import 'package:flutter_beginning_app/Model/CartModel.dart';
import 'package:flutter_beginning_app/utils/Themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/Store.dart';

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
        body: Column(children: [_cartList().expand(), _priceWidget()]));
  }
}

class _priceWidget extends StatelessWidget {
  const _priceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        "\$${_cart.totalPrice}".text.xl4.color(MyTheme.darkBluishColor).make(),
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buy not Supported yet".text.make()));
            print("Buy Button Clicked");
          },
          child: "Buy".text.xl.white.make().p8(),
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0)))),
        ).w32(context)
      ]),
    );
  }
}

class _cartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/NotFound.png",
                  fit: BoxFit.cover,
                ),
                "Products Not Founded".text.xl4.make()
              ],
            ),
          )
        : ListView.builder(
            itemCount: _cart.items.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
                  // color: MyTheme.darkBluishColor,
                  child: Card(
                    color: MyTheme.darkBluishColor,
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                        leading: Icon(
                          Icons.done,
                          color: Colors.lightGreenAccent,
                        ),
                        title: "${_cart.items[index].name}"
                            .text
                            .color(MyTheme.creamColor)
                            .white
                            .xl2
                            .make(),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle_outline,
                            color: Colors.redAccent,
                          ),
                        )).py2(),
                  ),
                ));
  }
}
