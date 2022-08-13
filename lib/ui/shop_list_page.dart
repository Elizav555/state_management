import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_architecture/model/main_state.dart';

import '../components/shop_list_component.dart';

class ShopListPage extends Page<MainState, void> {
  ShopListPage()
      : super(
            initState: MainState.initState,
            dependencies: Dependencies(
              slots: {
                'shopList': CartConnector() + ShopListComponent(),
              },
            ),
            view: (state, dispatch, viewService) {
              final shopListWidget = viewService.buildComponent('shopList');
              return shopListWidget;
            });
}
