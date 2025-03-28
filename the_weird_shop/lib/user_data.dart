import 'package:flutter/material.dart';
import 'package:the_weird_shop/item.dart';
import 'package:the_weird_shop/receipt.dart';

class UserData extends ChangeNotifier {
  final List<Item> _itemList = <Item>[
    Item('Tap Water', 0, 0),
    Item('Iron', 0.01, 0),
    Item('Silver', 200, 0),
    Item('Gold', 10000, 0),
    Item('Rhodium', 500000, 0),
    Item('Oganesson', 75000000, 0),
    Item('Unicorn Powder', 250000000, 0),
  ];

  final List<Receipt> _receiptList = <Receipt>[];

  double _money = 0;

  void buy(Item item, double amount) {
    _money -= amount * item.getCost();

    item.setAmount(item.getAmount() + amount);

    notifyListeners();
  }

  void addToReceiptList(String name) {
    _receiptList.add(Receipt(Item.copyItemList(_itemList), name));

    for (Item item in _itemList) {
      item.setAmount(0);
    }

    notifyListeners();
  }

  void returnItems() {
    for (Item item in _itemList) {
      _money += item.getCost() * item.getAmount();

      item.setAmount(0);
    }

    notifyListeners();
  }

  void setMoney(double money) {
    _money = money;

    notifyListeners();
  }

  List<Item> getItemList() {
    return _itemList;
  }

  List<Receipt> getReceiptList() {
    return _receiptList;
  }

  double getMoney() {
    return _money;
  }
}
