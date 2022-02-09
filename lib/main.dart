import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/util/singleton.dart';

import 'app.dart';

Future<void> main() async {
  await AppSingleton.setup();
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) window.document.onContextMenu.listen((e) => e.preventDefault());
  runApp(const App());
}
