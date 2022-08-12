import '../model/item.dart';

class AddToCartAction {
  AddToCartAction({required this.item});

  Item item;
}

class RemoveFromCartAction {
  RemoveFromCartAction({required this.item});

  Item item;
}
