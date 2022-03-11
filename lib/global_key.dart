import 'package:flutter/material.dart';

import 'util/singleton.dart';

class AppGlobal {
  static final AppGlobal _instance = AppSingleton.instance<AppGlobal>();

  final _navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<NavigatorState> navigatorKey = _instance._navigatorKey;
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      _instance._messengerKey;
  static BuildContext context = navigatorKey.currentContext!;
}
