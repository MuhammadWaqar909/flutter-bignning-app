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
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
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
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(children: [
        Hero(
          tag: Key(cataloge.id.toString()),
          child: Image.network(cataloge.image),
        ).h32(context),
        Expanded(
          child: VxArc(
            height: 10.0,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: context.cardColor,
              width: context.screenWidth,
              child: Column(children: [
                Text(
                  cataloge.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(cataloge.desc),
                "Dolor dolor takimata amet ea est ipsum eos. No justo et ipsum invidunt. Rebum justo ea est et stet. Aliquyam amet vero sea eos magna rebum labore consetetur, dolor vero sed tempor gubergren, et erat no sea aliquyam consetetur est et labore et. Ut sea sanctus et justo, diam elitr."
                    .text
                    .align(TextAlign.center)
                    .make()
                    .p16()
              ]).py24(),
            ),
          ),
        )
      ]),
    );
  }
}
