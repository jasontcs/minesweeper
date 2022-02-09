import 'package:flutter/material.dart';
import 'package:minesweeper/util/singleton.dart';

import 'app.dart';

Future<void> main() async {
  await AppSingleton.setup();
  runApp(const App());
}
