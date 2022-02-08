import 'package:get_it/get_it.dart';

import 'service.dart';

class ServiceLocator {
  final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();
  static final instance = ServiceLocator();

  void setUp() {
    _getIt.registerLazySingleton<Service>(() => FakeService());
  }
}
