import 'package:flutter/material.dart';

import 'cart_list.dart';
import 'model/item.dart';
import 'model/shopping_cart.dart';

class ShopListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ShopListState();
  }
}

class _ShopListState extends State<ShopListWidget> {
  ShoppingCart cart = ShoppingCart();
  final List<Item> items = Item.dummyItems;

  @override
  Widget build(BuildContext context) {
    final columnCount =
        MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 4;

    final width = MediaQuery.of(context).size.width / columnCount;
    const height = 400;

    var items = <Widget>[];
    for (var x = 0; x < this.items.length; x++) {
      bool isSideLine;
      if (columnCount == 2) {
        isSideLine = x % 2 == 0;
      } else {
        isSideLine = x % 4 != 3;
      }
      final item = this.items[x];

      items.add(_ShopListItem(
        item: item,
        isInCart: cart.isExists(item),
        isSideLine: isSideLine,
        onTap: (item) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          if (cart.isExists(item)) {
            cart.remove(item);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Item is removed from cart!'),
            ));
          } else {
            cart.add(item);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Item is added to cart!'),
            ));
          }
          setState(() {});
        },
      ));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Store'),
        ),
        body: GridView.count(
          childAspectRatio: width / height,
          scrollDirection: Axis.vertical,
          crossAxisCount: columnCount,
          children: items,
        ),
        floatingActionButton: cart.isEmpty
            ? null
            : FloatingActionButton.extended(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CartListWidget(
                            cart: cart,
                          )));
                },
                icon: Icon(Icons.shopping_cart),
                label: Text('${cart.numOfItems}'),
              ));
  }
}

class _ShopListItem extends StatelessWidget {
  final Item item;
  final bool isInCart;
  final bool isSideLine;
  dynamic onTap;

  _ShopListItem(
      {required this.item,
      required this.isInCart,
      required this.isSideLine,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    Border border;
    if (isSideLine) {
      border = Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
          right: BorderSide(color: Colors.grey, width: 0.5));
    } else {
      border = Border(bottom: BorderSide(color: Colors.grey, width: 0.5));
    }

    return InkWell(
        onTap: () => onTap(item),
        child: Container(
            decoration: BoxDecoration(border: border),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                Container(
                  height: 250,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(item.imageUrl),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                Text(item.price.toString(), textAlign: TextAlign.center),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                ),
                Text(isInCart ? 'In Cart' : 'Available',
                    textAlign: TextAlign.center),
              ],
            )));
  }
}
