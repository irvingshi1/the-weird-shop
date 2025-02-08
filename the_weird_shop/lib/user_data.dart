import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  double _money = 0.00;

  void setMoney(double money) {
    _money = money;
  }

  double getMoney() {
    return _money;
  }
}