import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/util/singleton.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await AppSingleton.setup();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb) window.document.onContextMenu.listen((e) => e.preventDefault());

  runApp(const App());
}
