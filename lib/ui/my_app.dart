import 'package:flutter/material.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'shop_list.dart';

class MyApp extends StatelessWidget {
  final Store<ShoppingCart> store;

  MyApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<ShoppingCart>(
        store: store,
        child: MaterialApp(
            title: 'Shop',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: StoreBuilder<ShoppingCart>(
              builder: (BuildContext context, Store<ShoppingCart> store) =>
                  ShopListWidget(
                null,
                store: store,
              ),
            )));
  }
}
