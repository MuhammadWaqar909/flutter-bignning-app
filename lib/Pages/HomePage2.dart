import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beginning_app/Model/Cataloge.dart';
import 'package:flutter_beginning_app/Pages/AddItemButton.dart';
// import 'package:flutter_beginning_app/Pages/CartPage.dart';
import 'package:flutter_beginning_app/Pages/ProductDetail.dart';
import 'package:flutter_beginning_app/core/Store.dart';
import 'package:flutter_beginning_app/utils/Themes.dart';
import 'package:flutter_beginning_app/utils/routes/routes.dart';
// import 'package:flutter_beginning_app/utils/Themes.dart';
// import '../Widgets/ItemWidget.dart';
// import '../Widgets/Drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

import '../Model/CartModel.dart';

// ignore: must_be_immutable
class HomePage2 extends StatefulWidget {
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  int count = 22;

  final name = 'Wiki First App';
  final url = "https://stage.zab.ee/api/getProduct/featured";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogeString =
        await rootBundle.loadString("assets/file/Cataloge2.json");
    final catalogeDecodeData = await jsonDecode(catalogeString);

    CatalogeModel.item = List.from(catalogeDecodeData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});

    // is for api Call to extract data
    // final url = "https://stage.zab.ee/api/getProduct/featured";
    // final responce = await http.get(Uri.parse(url));
    // final catalogeData = await responce.body;
    // print("checking 1 ...");
    // print(catalogeData);
    // final catalogeDecodeData = await jsonDecode(catalogeData);
    // print("checking 2 .....");
    // print("this Cataloge Decode Data \n\n$catalogeDecodeData");
    // // var productData = catalogeDecodeData["products"];
    // CatalogeModel.item = List.from(catalogeDecodeData)
    //     .map<Item>((item) => Item.fromMap(item))
    //     .toList();
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, MyRoutes.loginRoutes);
              },
              child: Row(
                children: [Text("Logout")],
              )).w(110)),
      floatingActionButton: VxBuilder(
        builder: ((context, store, status) => FloatingActionButton(
              hoverColor: Colors.red,
              backgroundColor: Colors.indigoAccent,
              onPressed: () =>
                  {Navigator.pushNamed(context, MyRoutes.cartPage)},
              child: Icon(CupertinoIcons.cart_fill_badge_plus),
            ).badge(
                size: 22,
                count: _cart.items.length,
                color: Vx.green300,
                textStyle: TextStyle(color: Colors.black))),
        mutations: {AddMutation, RemoveMutation},
      ),
      backgroundColor: context.canvasColor,
      body: Container(
        // margin: EdgeInsets.only(top: 24),
        padding: Vx.m32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            if (CatalogeModel.item.isNotEmpty)
              CatelogeList().expand()
            else
              CircularProgressIndicator().centered().py16().expand(),
          ],
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
        "Catalogue App".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
        "Featured Products".text.xl2.make().py12()
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
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetail(cataloge: cataloge))),
            child: Hero(
                tag: Key(cataloge.id.toString()),
                child: CatalogeItem(cataloge: cataloge)));
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
          Image.network(cataloge.image).box.make().px8().w32(context),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cataloge.name.text
                  .textStyle(TextStyle(color: MyTheme.darkBluishColor))
                  .bold
                  .lg
                  .overflow(TextOverflow.fade)
                  .make()
                  .h(24)
                  .px8(),
              cataloge.desc.text
                  .textStyle(
                      TextStyle(color: Color.fromARGB(255, 172, 175, 140)))
                  .overflow(TextOverflow.fade)
                  .make()
                  .h8(context)
                  .px8(),
              BuyPriceWidget(cataloge: cataloge)
            ],
          ))
        ],
      )).white.roundedSM.square(150).make().py16().wHalf(context),
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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        '\$${cataloge.price}'.text.xl.bold.make(),
        AddItemButton(cataloge: cataloge)
      ],
    );
  }
}
