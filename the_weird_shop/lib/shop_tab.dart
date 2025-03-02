import 'package:flutter/material.dart';
import 'package:the_weird_shop/details.dart';
import 'package:the_weird_shop/item.dart';

class ShopTab extends StatefulWidget {
  const ShopTab({super.key});

  @override
  State<ShopTab> createState() {
    return _ShopTab();
  }
}

class _ShopTab extends State<ShopTab> {
  List<Item> itemList = <Item>[
    Item('Iron', 0.01),
    Item('Oganesson', 750000),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
            itemList[index].getName(),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const Details();
                },
                settings: RouteSettings(
                  arguments: itemList[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}