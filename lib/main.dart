import 'package:flutter/material.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';
import 'package:flutter_architecture/reducers/cartReducer.dart';
import 'package:redux/redux.dart';

import 'ui/my_app.dart';

final store = Store<ShoppingCart>(cartReducer, initialState: ShoppingCart());

void main() {
  runApp(MyApp(store: store));
}
