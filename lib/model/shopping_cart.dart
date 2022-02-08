import 'package:uuid/uuid.dart';

import 'item.dart';

class ShoppingCart {
  final orderId = Uuid().v4();
  List<Item> items = [];

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
    if (items.isEmpty) {
      items.add(item);
      return;
    }
    if (!isExists(item)) {
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

  Map<String, dynamic> get toMap {
    final List<Map<String, dynamic>> items = this
        .items
        .map((i) => {
              'id': i.id,
              'name': i.name,
              'description': i.description,
              'price': i.price,
              'imageUrl': i.imageUrl
            })
        .toList();
    return {'orderId': orderId, 'items': items, 'total': totalPrice};
  }
}
