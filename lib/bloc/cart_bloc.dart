import 'dart:async';

import 'package:flutter_architecture/model/item.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  Item item;

  AddToCartEvent({required this.item});
}

class RemoveFromCartEvent extends CartEvent {
  Item item;

  RemoveFromCartEvent({required this.item});
}

class CartBloc {
  final _cartStateController = StreamController<ShoppingCart>();
  final _eventController = StreamController<CartEvent>();

  Stream<ShoppingCart> get cartState => _cartStateController.stream;

  Sink<CartEvent> get action => _eventController.sink;

  CartBloc() {
    _eventController.stream.listen(handleEvent);
  }

  void handleEvent(CartEvent event) {
    if (event is AddToCartEvent) {
      addToCart(event.item);
    } else if (event is RemoveFromCartEvent) {
      removeFromCart(event.item);
    }
    _cartStateController.add(cart);
  }

  ShoppingCart cart = ShoppingCart();

  String get getTotalPrice => cart.totalPrice.toString();

  void addToCart(Item item) {
    cart.add(item);
  }

  void removeFromCart(Item item) {
    cart.remove(item);
  }

  void dispose() {
    _cartStateController.close();
    _eventController.close();
  }
}
