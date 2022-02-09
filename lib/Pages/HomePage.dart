import 'package:flutter/material.dart';
import 'package:flutter_beginning_app/Model/Cataloge.dart';
import '../Widgets/ItemWidget.dart';
import '../Widgets/Drawer.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  int count = 22;
  final dummylist = List.generate(6, (itemIndex) => CatalogeModel.item[0]);
  final name = 'Wiki First App';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Center(child: Text("Wiki Flutter App"))),
      // for center main title
      appBar: AppBar(title: Text("Wiki Flutter App")),
      body: ListView.builder(
        itemCount: dummylist.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: dummylist[index],
          );
        },
      ),
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