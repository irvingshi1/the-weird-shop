import 'package:flutter/material.dart';
import 'package:the_weird_shop/item.dart';
import 'package:the_weird_shop/receipt.dart';

class UserData extends ChangeNotifier {
  List<Receipt> _receiptList = <Receipt>[];

  final List<Item> _itemList = <Item>[
    Item('Tap Water', 0, 0),
    Item('Iron', 0.01, 0),
    Item('Silver', 200, 0),
    Item('Gold', 10000, 0),
    Item('Rhodium', 50000, 00),
    Item('Oganesson', 75000000, 0),
    Item('Unicorn Powder', 250000000, 0),
  ];

  double _money = 0;

  void buy(Item item, double amount, BuildContext context) {
    final double totalCost = amount * item.getCost();

    if (amount == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Invalid Input'),
            content: Text('The amount needs to be nonzero.'),
          );
        },
      );
    } else if (_money >= totalCost) {
      _money -= totalCost;

      item.setAmount(item.getAmount() + amount);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Purchase Succeeded'),
            content: Text('Brought $amount ${item.getName()}.'),
          );
        },
      );
    } else if (amount < 0) {
      _money -= totalCost;

      item.setAmount(item.getAmount() + amount);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Selling Succeeded'),
            content: Text('Sold ${-amount} ${item.getName()}.'),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Purchase Failed'),
            content: Text('Not enough money.'),
          );
        },
      );
    }
  }

  void addToReceiptList() {
    _receiptList.add(Receipt(_itemList));

    resetItemList();
  }

  void resetItemList() {
    for (Item item in _itemList) {
      item.setAmount(0);
    }
  }

  void setMoney(double money) {
    _money = money;

    notifyListeners();
  }

  List<Item> getItemList() {
    return _itemList;
  }

  double getMoney() {
    return _money;
  }
}
