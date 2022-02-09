abstract class TimerEvent {}

class TimerStarted extends TimerEvent {}

class TimerTicked extends TimerEvent {
  final int second;

  TimerTicked({required this.second});
}

class TimerStopped extends TimerEvent {}

class TimerResetted extends TimerEvent {}
