import 'package:flutter_architecture/model/item.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Cubit<ShoppingCart> {
  CartBloc() : super(ShoppingCart());

  void addToCart(Item item) {
    var newState = ShoppingCart();
    newState.items = state.items;
    newState.add(item);
    emit(newState);
  }

  void removeFromCart(Item item) {
    var newState = ShoppingCart();
    newState.items = state.items;
    newState.remove(item);
    emit(newState);
  }
}
