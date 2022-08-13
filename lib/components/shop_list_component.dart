import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_architecture/model/shopping_cart.dart';
import 'package:flutter_architecture/reducers/cartReducer.dart';

import '../ui/shop_list_view.dart';

class ShopListComponent extends Component<ShoppingCartState> {
  ShopListComponent()
      : super(
          reducer: cartStateReducer,
          view: shopListView,
        );
}
