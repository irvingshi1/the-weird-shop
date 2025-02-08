import 'package:flutter/material.dart';
import 'package:the_weird_shop/item.dart';

class ShopTab extends StatefulWidget {
  const ShopTab({super.key});

  @override
  State<ShopTab> createState() {
    return _ShopTab();
  }
}

class _ShopTab extends State<ShopTab> {
  List<Item> itemList = <Item>[];

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}