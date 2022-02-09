import 'dart:async';

import 'package:minesweeper/util/singleton.dart';

class TimerService {
  static TimerService instance = AppSingleton.instance<TimerService>();

  final StreamController<int> _controller = StreamController<int>();
  Timer? _timer;
  int _second = 0;

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _second++;
      _controller.add(_second);
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void reset() {
    _second = 0;
    _controller.add(_second);
  }

  int get now => _second;

  Stream<int> get time => _controller.stream;
}
