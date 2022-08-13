import 'package:fish_redux/fish_redux.dart';

import '../model/item.dart';

enum Actions { addToCart, removeFromCart }

class ActionsCreate {
  static Action addToCart(Item item) =>
      Action(Actions.addToCart, payload: item);

  static Action removeFromCart(Item item) =>
      Action(Actions.removeFromCart, payload: item);
}
