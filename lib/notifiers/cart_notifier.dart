import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/item.dart';
import '../model/shopping_cart.dart';

class CartState extends StateNotifier<ShoppingCart> {
  CartState() : super(ShoppingCart());

  String get getTotalPrice => state.totalPrice.toString();

  void addToCart(Item item) {
    var newState = ShoppingCart();
    newState.items = state.items;
    newState.add(item);
    state = newState;
  }

  void removeFromCart(Item item) {
    var newState = ShoppingCart();
    newState.items = state.items;
    newState.remove(item);
    state = newState;
  }
}
