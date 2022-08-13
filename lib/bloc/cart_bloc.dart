import 'package:flutter_architecture/model/item.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  Item item;

  AddToCartEvent({required this.item});
}

class RemoveFromCartEvent extends CartEvent {
  Item item;

  RemoveFromCartEvent({required this.item});
}

class CartBloc extends Bloc<CartEvent, ShoppingCart> {
  CartBloc() : super(ShoppingCart()) {
    on<AddToCartEvent>(addToCart);
    on<RemoveFromCartEvent>(removeFromCart);
  }

  void addToCart(AddToCartEvent event, Emitter<ShoppingCart> emit) {
    var newState = ShoppingCart();
    newState.items = state.items;
    newState.add(event.item);
    emit(newState);
  }

  void removeFromCart(RemoveFromCartEvent event, Emitter<ShoppingCart> emit) {
    var newState = ShoppingCart();
    newState.items = state.items;
    newState.remove(event.item);
    emit(newState);
  }
}
