import 'package:flutter/material.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';
import 'package:provider/provider.dart';

import 'shop_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => ShoppingCart(),
        child: MaterialApp(
          title: 'Shop',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ShopListWidget(),
        ));
  }
}
