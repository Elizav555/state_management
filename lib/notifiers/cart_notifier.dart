import 'package:flutter/material.dart';
import 'package:flutter_architecture/model/item.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';

class CartState with ChangeNotifier {
  ShoppingCart cart = ShoppingCart();

  String get getTotalPrice => cart.totalPrice.toString();

  void addToCart(Item item) {
    cart.add(item);
    notifyListeners();
  }

  void removeFromCart(Item item) {
    cart.remove(item);
    notifyListeners();
  }
}
