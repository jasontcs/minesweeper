export 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/win_record_model.dart';
import 'package:minesweeper/service/win_record/win_record_service.dart';
part 'win_record_event.dart';
part 'win_record_state.dart';

class WinRecordBloc extends Bloc<WinRecordEvent, WinRecordState> {
  final WinRecordService _winRecordService = WinRecordService.instance;

  WinRecordBloc() : super(WinRecordState()) {
    on<_WinRecordInit>((event, emit) async {
      await _winRecordService.login(null);
      await emit.forEach(_winRecordService.winRecords,
          onData: ((List<WinRecord> winRecords) =>
              state.copyWith(winRecords: winRecords)));
    });
    on<WinRecordAdd>((event, emit) async {
      await _winRecordService.addRecord(
          score: event.score, difficulty: event.difficultyOption);
    });
    add(_WinRecordInit());
  }
}
