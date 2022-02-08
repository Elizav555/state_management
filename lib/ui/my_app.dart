import 'package:flutter/material.dart';
import 'package:flutter_architecture/notifiers/cart_notifier.dart';
import 'package:provider/provider.dart';

import 'shop_list.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartState>(
        create: (_) => CartState(),
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
