import 'package:flutter_architecture/actions/cartActions.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';
import 'package:redux/redux.dart';

ShoppingCart cartReducer(ShoppingCart state, action) {
  return _cartReducer(state, action);
}

final _cartReducer = combineReducers<ShoppingCart>({
  TypedReducer<ShoppingCart, AddToCartAction>(_addToCart),
  TypedReducer<ShoppingCart, RemoveFromCartAction>(_removeFromCart)
});

ShoppingCart _addToCart(ShoppingCart cart, AddToCartAction action) {
  var newCart = cart.copyWith();
  newCart.add(action.item);
  return newCart;
}

ShoppingCart _removeFromCart(ShoppingCart cart, RemoveFromCartAction action) {
  var newCart = cart.copyWith();
  newCart.remove(action.item);
  return newCart;
}
