import 'package:flutter/material.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';
import 'package:flutter_architecture/notifiers/cart_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'shop_list.dart';

final StateNotifierProvider<CartState, ShoppingCart> cartStateProvider =
    StateNotifierProvider<CartState, ShoppingCart>((_) => CartState());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ShopListWidget(),
      ),
    );
  }
}
