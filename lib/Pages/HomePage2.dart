import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beginning_app/Model/Cataloge.dart';
import 'package:flutter_beginning_app/utils/Themes.dart';
// import 'package:flutter_beginning_app/utils/Themes.dart';
import '../Widgets/ItemWidget.dart';
// import '../Widgets/Drawer.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class HomePage2 extends StatefulWidget {
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int count = 22;

  final name = 'Wiki First App';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 2));
    final catalogeString =
        await rootBundle.loadString("assets/file/Cataloge.json");
    final catalogeDecodeData = await jsonDecode(catalogeString);
    var productData = catalogeDecodeData["products"];
    CatalogeModel.item =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: Container(
        margin: EdgeInsets.only(top: 24),
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Header(), CatelogeList().expand()],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalogue App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Featured Products".text.xl2.make().py16()
      ],
    );
  }
}

class CatelogeList extends StatelessWidget {
  const CatelogeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogeModel.item.length,
      itemBuilder: (context, index) {
        final cataloge = CatalogeModel.item[index];
        return CatalogeItem(cataloge: cataloge);
      },
    );
  }
}

class CatalogeItem extends StatelessWidget {
  final Item cataloge;
  const CatalogeItem({Key? key, required this.cataloge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VxBox(
          child: Row(
        children: [
          Image.network(cataloge.image).box.make().py(16).w32(context),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cataloge.name.text
                  .textStyle(TextStyle(color: MyTheme.darkBluishColor))
                  .bold
                  .lg
                  .make(),
              cataloge.desc.text
                  .textStyle(
                      TextStyle(color: Color.fromARGB(255, 172, 175, 140)))
                  .make()
                  .wHalf(context),
              BuyPriceWidget(cataloge: cataloge)
            ],
          ))
        ],
      )).white.roundedSM.square(150).make().py16(),
    );
  }
}

class BuyPriceWidget extends StatelessWidget {
  final cataloge;
  const BuyPriceWidget({Key? key, required this.cataloge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        '\$${cataloge.price}'.text.xl.bold.make().w32(context),
        ElevatedButton(onPressed: () {}, child: Text("Buy"))
      ],
    );
  }
}
