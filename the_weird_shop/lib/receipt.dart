import 'package:the_weird_shop/item.dart';

class Receipt {
  final List<Item> _itemList;

  double getTotalCost() {
    double totalCost = 0;

    for(Item item in _itemList) {
      totalCost += item.getCost();
    }

    return totalCost;
  }

  Receipt(this._itemList);
}
