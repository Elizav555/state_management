import 'package:mobx/mobx.dart';

import 'item.dart';

part 'shopping_cart.g.dart';

class ShoppingCart = CartBase with _$ShoppingCart;

abstract class CartBase with Store {
  @observable
  List<Item> items = [];

  @computed
  bool get isEmpty => items.isEmpty;

  @computed
  int get numOfItems => items.length;

  @computed
  int get totalPrice {
    var totalPrice = 0;
    items.forEach((i) {
      totalPrice += i.price;
    });
    return totalPrice;
  }

  @action
  bool isExists(item) {
    if (items.isEmpty) {
      return false;
    }
    final indexOfItem = items.indexWhere((i) => item.id == i.id);
    return indexOfItem >= 0;
  }

  @action
  void add(Item item) {
    if (items.isEmpty || !isExists(item)) {
      items.add(item);
    }
    items = List.of(items);
  }

  @action
  void remove(Item item) {
    if (items.isEmpty) return;
    final indexOfItem = items.indexWhere((i) => item.id == i.id);
    if (indexOfItem >= 0) {
      items.removeAt(indexOfItem);
    }
    items = List.of(items);
  }
}
