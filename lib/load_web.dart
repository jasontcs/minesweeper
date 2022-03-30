// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:flutter/foundation.dart';

void load() {
  if (kIsWeb) window.document.onContextMenu.listen((e) => e.preventDefault());
}
