import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/item.dart';
import 'my_app.dart';

class CartListWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var items = <Widget>[];

    final cart = ref.watch(cartStateProvider);
    cart.items.forEach((c) {
      items.add(_CartListItemWidget(
        item: c,
      ));
      items.add(Padding(
        padding: EdgeInsets.only(top: 8.0),
      ));
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('My Cart'),
        ),
        body: Container(
            decoration: BoxDecoration(color: Color(0xfff0eff4)),
            child: Stack(
              children: <Widget>[
                ListView(
                  padding: EdgeInsets.only(bottom: 64),
                  children: items,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 64,
                  child: _CartListSummaryFooterWidget(
                    totalPrice:
                        ref.watch(cartStateProvider.notifier).getTotalPrice,
                  ),
                )
              ],
            )));
  }
}

class _CartListSummaryFooterWidget extends StatelessWidget {
  final String totalPrice;

  _CartListSummaryFooterWidget({required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Color(0XFFF4F4F4),
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
              child: Row(
            children: <Widget>[
              Text('Total', textAlign: TextAlign.left),
              Expanded(child: Text(totalPrice, textAlign: TextAlign.right))
            ],
          )),
        ));
  }
}

class _CartListItemWidget extends StatelessWidget {
  final Item item;

  _CartListItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: Colors.grey, width: 0.5),
              bottom: BorderSide(color: Colors.grey, width: 0.5))),
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 64,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(item.imageUrl),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          Expanded(child: Text(item.name)),
          Padding(
            padding: EdgeInsets.only(right: 8.0),
          ),
          Text(item.price.toString(), textAlign: TextAlign.right)
        ],
      ),
    );
  }
}
