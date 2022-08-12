import 'dart:async';

import 'package:flutter_architecture/model/item.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';

class CartBloc {
  final _cartStateController = StreamController<ShoppingCart>();

  Stream<ShoppingCart> get cartState => _cartStateController.stream;

  void addToCart(Item item) {
    cart.add(item);
    _cartStateController.add(cart);
  }

  void removeFromCart(Item item) {
    cart.remove(item);
    _cartStateController.add(cart);
  }

  ShoppingCart cart = ShoppingCart();

  String get getTotalPrice => cart.totalPrice.toString();

  void dispose() {
    _cartStateController.close();
  }
}
