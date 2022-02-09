import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/service/timer/timer_service.dart';

import 'timer_event.dart';
import 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final TimerService _timerService = TimerService.instance;

  TimerBloc() : super(TimerState()) {
    _timerService.time.listen(
      (second) {
        add(TimerTicked(second: second));
      },
    );
    on<TimerTicked>((event, emit) {
      emit(TimerState(second: event.second));
    });
    on<TimerStarted>((event, emit) async {
      _timerService.start();
      _timerService.time.listen((second) {});
    });
    on<TimerStopped>((event, emit) {
      _timerService.stop();
    });
    on<TimerResetted>((event, emit) {
      _timerService.reset();
    });
  }
}
