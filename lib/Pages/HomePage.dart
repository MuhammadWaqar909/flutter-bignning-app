import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  int count = 22;
  final name = 'Wiki First App';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Center(child: Text("Wiki Flutter App"))),
      // for center main title
      appBar: AppBar(title: Text("Wiki Flutter App")),
      body: Container(
        child: Center(
            child: Container(
                child: Text("Text count $count in the That's the $name"))),
      ),
      drawer: Drawer(),
    );
  }
}
