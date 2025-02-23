import 'package:flutter/material.dart';
import 'package:the_weird_shop/item.dart';

class UserData extends ChangeNotifier {
  double _money = double.infinity;

  void setMoney(double money) {
    _money = money;
  }

  void buy(Item item) {
    if(_money >= item.getCost()) {
      _money -= item.getCost();
    }
  }

  double getMoney() {
    return _money;
  }
}