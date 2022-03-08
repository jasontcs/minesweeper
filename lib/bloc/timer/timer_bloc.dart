export 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/service/timer/timer_service.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final TimerService _timerService = TimerService.instance;

  TimerBloc() : super(TimerState()) {
    on<_TimerInitial>((event, emit) async {
      await emit.forEach(_timerService.time,
          onData: ((int second) => TimerState(second: second)));
    });
    on<TimerStarted>((event, emit) async {
      _timerService.start();
    });
    on<TimerStopped>((event, emit) {
      _timerService.stop();
    });
    on<TimerResetted>((event, emit) {
      _timerService.reset();
    });
    add(_TimerInitial());
  }
}
