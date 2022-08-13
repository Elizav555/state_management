import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_architecture/actions/cartActions.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';

ShoppingCartState cartStateReducer(ShoppingCartState state, action) {
  switch (action.type) {
    case Actions.addToCart:
      return _addToCart(state, action);
    case Actions.removeFromCart:
      return _removeFromCart(state, action);
    default:
      return state;
  }
}

ShoppingCartState _addToCart(ShoppingCartState state, Action action) {
  state.add(action.payload);
  return state.clone();
}

ShoppingCartState _removeFromCart(ShoppingCartState state, Action action) {
  state.remove(action.payload);
  return state.clone();
}
