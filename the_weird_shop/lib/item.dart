class Item {
  final String _name;

  final double _cost;

  double _amount;

  void setAmount(double amount) {
    _amount = amount;
  }

  String getName() {
    return _name;
  }

  double getCost() {
    return _cost;
  }

  double getAmount() {
    return _amount;
  }

  Item(this._name, this._cost, this._amount);

  Item.copy(Item item)
      : _name = item._name,
        _cost = item._cost,
        _amount = item._amount;
}
