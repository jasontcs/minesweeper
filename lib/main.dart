import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/util/singleton.dart';

import 'app.dart';
import 'firebase_options.dart';
import 'util/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AppSingleton.setup();

  if (kIsWeb) window.document.onContextMenu.listen((e) => e.preventDefault());

  BlocOverrides.runZoned(
    () {
      runApp(const App());
    },
    blocObserver: AppBlocObserver(),
  );
}
