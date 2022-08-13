import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';

class MainState implements Cloneable<MainState> {
  late ShoppingCartState cartState;

  @override
  MainState clone() {
    return MainState()..cartState = cartState;
  }

  static MainState initState(dynamic params) {
    return MainState()..cartState = ShoppingCartState();
  }
}

class CartConnector extends ConnOp<MainState, ShoppingCartState> {
  @override
  ShoppingCartState get(MainState state) => state.cartState;

  @override
  void set(MainState state, ShoppingCartState subState) =>
      state.cartState = subState;
}
