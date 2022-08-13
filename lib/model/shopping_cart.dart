import 'package:fish_redux/fish_redux.dart';

import 'item.dart';

class ShoppingCartState implements Cloneable<ShoppingCartState> {
  List<Item> items = [];

  static ShoppingCartState initState(dynamic params) {
    return ShoppingCartState()..items = [];
  }

  bool get isEmpty => items.isEmpty;

  int get numOfItems => items.length;

  int get totalPrice {
    var totalPrice = 0;
    items.forEach((i) {
      totalPrice += i.price;
    });
    return totalPrice;
  }

  bool isExists(item) {
    if (items.isEmpty) {
      return false;
    }
    final indexOfItem = items.indexWhere((i) => item.id == i.id);
    return indexOfItem >= 0;
  }

  void add(Item item) {
    if (items.isEmpty || !isExists(item)) {
      items.add(item);
    }
  }

  void remove(Item item) {
    if (items.isEmpty) return;
    final indexOfItem = items.indexWhere((i) => item.id == i.id);
    if (indexOfItem >= 0) {
      items.removeAt(indexOfItem);
    }
  }

  @override
  ShoppingCartState clone() {
    return ShoppingCartState()..items = items;
  }
}
