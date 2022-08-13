import 'package:flutter/material.dart';

import 'item.dart';

@immutable
class ShoppingCart {
  const ShoppingCart({
    this.items = const [],
  });

  factory ShoppingCart.initial() => const ShoppingCart();

  final List<Item> items;

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

  ShoppingCart copyWith({
    List<Item>? items,
  }) =>
      ShoppingCart(
        items: items ?? this.items,
      );
}
