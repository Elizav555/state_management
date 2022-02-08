import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/item.dart';
import '../model/shopping_cart.dart';

class CartState extends StateNotifier<ShoppingCart> {
  CartState() : super(ShoppingCart());

  String get getTotalPrice => state.totalPrice.toString();

  void addToCart(Item item) {
    state.add(item);
  }

  void removeFromCart(Item item) {
    state.remove(item);
  }
}
