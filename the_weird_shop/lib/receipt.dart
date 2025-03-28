import 'package:the_weird_shop/item.dart';

class Receipt {
  final List<Item> _itemList;

  final String _name;

  List<Item> getItemList() {
    return _itemList;
  }

  double getTotalCost() {
    double totalCost = 0;

    for (Item item in _itemList) {
      totalCost += item.getCost() * item.getAmount();
    }

    return totalCost;
  }

  String getName() {
    return _name;
  }

  Receipt(this._itemList, this._name);
}
