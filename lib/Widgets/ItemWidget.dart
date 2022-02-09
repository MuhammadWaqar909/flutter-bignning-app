import 'package:flutter/material.dart';
import 'package:flutter_beginning_app/Model/Cataloge.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: StadiumBorder(),
        child: ListTile(
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            '\$${item.price}',
            style: TextStyle(color: Colors.deepPurple, fontSize: 25),
          ),
        ));
  }
}
