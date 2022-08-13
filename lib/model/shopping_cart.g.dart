// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShoppingCart on CartBase, Store {
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??=
          Computed<bool>(() => super.isEmpty, name: 'CartBase.isEmpty'))
      .value;
  Computed<int>? _$numOfItemsComputed;

  @override
  int get numOfItems => (_$numOfItemsComputed ??=
          Computed<int>(() => super.numOfItems, name: 'CartBase.numOfItems'))
      .value;
  Computed<int>? _$totalPriceComputed;

  @override
  int get totalPrice => (_$totalPriceComputed ??=
          Computed<int>(() => super.totalPrice, name: 'CartBase.totalPrice'))
      .value;

  late final _$itemsAtom = Atom(name: 'CartBase.items', context: context);

  @override
  List<Item> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Item> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$CartBaseActionController =
      ActionController(name: 'CartBase', context: context);

  @override
  bool isExists(dynamic item) {
    final _$actionInfo =
        _$CartBaseActionController.startAction(name: 'CartBase.isExists');
    try {
      return super.isExists(item);
    } finally {
      _$CartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(Item item) {
    final _$actionInfo =
        _$CartBaseActionController.startAction(name: 'CartBase.add');
    try {
      return super.add(item);
    } finally {
      _$CartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(Item item) {
    final _$actionInfo =
        _$CartBaseActionController.startAction(name: 'CartBase.remove');
    try {
      return super.remove(item);
    } finally {
      _$CartBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
isEmpty: ${isEmpty},
numOfItems: ${numOfItems},
totalPrice: ${totalPrice}
    ''';
  }
}
