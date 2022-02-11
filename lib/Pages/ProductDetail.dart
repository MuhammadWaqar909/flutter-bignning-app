import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_beginning_app/utils/Themes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatelessWidget {
  final cataloge;
  const ProductDetail({Key? key, required this.cataloge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ButtonBar(
        alignment: MainAxisAlignment.spaceBetween,
        buttonPadding: EdgeInsets.zero,
        children: [
          '\$${cataloge.price}'.text.bold.xl4.color(Colors.deepPurple).make(),
          ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0)))),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Buy",
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(CupertinoIcons.cart)
                ],
              )).wh(100, 50)
        ],
      ).p24(),
      appBar: AppBar(),
      body: Column(children: [
        Container(
          color: Colors.white,
          child: Hero(
            tag: Key(cataloge.id.toString()),
            child: Image.network(cataloge.image),
          ).h32(context),
        ).h32(context),
        Expanded(
          child: VxArc(
            height: 10.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: MyTheme.creamColor,
              width: context.screenWidth,
              child: Column(children: [
                Text(
                  cataloge.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(cataloge.desc)
              ]).py24(),
            ),
          ),
        )
      ]),
    );
  }
}
