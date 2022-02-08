import 'package:business/block_factory.dart';
import 'package:flutter/material.dart';

import 'ui/my_app.dart';

void main() {
  BlockFactory.instance.setUp();
  runApp(MyApp());
}
