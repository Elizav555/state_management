import 'package:flutter_architecture/actions/cartActions.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';
import 'package:redux/redux.dart';

import '../model/item.dart';

ShoppingCart cartReducer(ShoppingCart state, action) {
  return state.copyWith(
    items: _itemsReducer(state.items, action),
  );
}

final _itemsReducer = combineReducers<List<Item>>({
  TypedReducer<List<Item>, AddToCartAction>(_addToCart),
  TypedReducer<List<Item>, RemoveFromCartAction>(_removeFromCart)
});

List<Item> _addToCart(List<Item> items, AddToCartAction action) {
  items.add(action.item);
  return items;
}

List<Item> _removeFromCart(List<Item> items, RemoveFromCartAction action) {
  items.remove(action.item);
  return items;
}
