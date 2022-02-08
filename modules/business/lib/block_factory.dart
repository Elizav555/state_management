import 'package:data/data.dart';
import 'package:get_it/get_it.dart';

import 'main_bloc.dart';

class BlockFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();
  static final instance = BlockFactory();

  void setUp() {
    ServiceLocator.instance.setUp();
    _getIt.registerFactory<MainBloc>(
      () => MainBloc(service: ServiceLocator.instance.get<Service>()),
    );
  }
}
