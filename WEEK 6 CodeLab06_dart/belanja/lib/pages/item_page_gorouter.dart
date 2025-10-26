import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';

class ItemPageGoRouter extends StatelessWidget {
  final Item item;

  const ItemPageGoRouter({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Center(
        child: Text('Item details for: ${item.name}'),
      ),
    );
  }
}// TODO Implement this library.