// ignore_for_file: camel_case_types

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
        VxConsumer(
          builder: ((context, store, status) {
            return "\$${_cart.totalPrice}"
                .text
                .xl4
                .color(MyTheme.darkBluishColor)
                .make();
          }),
          mutations: {RemoveMutation},
          notifications: {},
        ),
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

class _cartList extends StatefulWidget {
  @override
  State<_cartList> createState() => _cartListState();
}

class _cartListState extends State<_cartList> {
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
            itemBuilder: (context, index) => Column(
                  // color: MyTheme.darkBluishColor,
                  children: [
                    // VxConsumer(builder: builder, mutations: , notifications: notifications)
                    Card(
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
                            onPressed: () {
                              RemoveMutation(_cart.items[index]);
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.redAccent,
                            ),
                          )).py2(),
                    )
                  ],
                ));
  }
}
