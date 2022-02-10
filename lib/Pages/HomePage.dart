import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_beginning_app/Model/Cataloge.dart';
import '../Widgets/ItemWidget.dart';
import '../Widgets/Drawer.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      // appBar: AppBar(title: Center(child: Text("Wiki Flutter App"))),
      // for center main title
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Wiki Products"),
      ),
      body: Padding(
          child: (CatalogeModel.item != null && CatalogeModel.item.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final item = CatalogeModel.item[index];
                    return Padding(
                        padding: EdgeInsets.all(10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          clipBehavior: Clip.antiAlias,
                          child: GridTile(
                            child: Image.network(item.image),
                            header: Text(
                              item.name,
                              style: TextStyle(fontWeight: FontWeight.w900),
                            ),
                            footer: Text('\$${item.price}'.toString()),
                          ),
                        ));
                  },
                  itemCount: CatalogeModel.item.length,
                  clipBehavior: Clip.hardEdge,
                )
              // ? ListView.builder(
              //     itemCount: CatalogeModel.item.length,
              //     itemBuilder: (context, index) {
              //       return ItemWidget(
              //         item: CatalogeModel.item[index],
              //       );
              //     },
              //   )
              : Center(child: CircularProgressIndicator()),
          padding: EdgeInsets.all(19)),
      drawer: DrawerWidget(),
    );
  }
}

        // child: Center(
        //     child: Column(
        //   children: [
        //     Image.asset(
        //       'assets/images/Home.png',
        //       fit: BoxFit.cover,
        //     ),
        //     Text("Text count $count in the That's the $name"),
        //     SizedBox(height: 20),
        //     ElevatedButton(
        //       onPressed: () {
        //         print("Home SignIn Button Target");
        //       },
        //       child: Text("Sign In"),
        //       style: TextButton.styleFrom(minimumSize: Size(150, 50)),
        //     )
        //   ],
        // )),