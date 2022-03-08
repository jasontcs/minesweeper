part of 'win_record_bloc.dart';

class WinRecordState {
  final List<WinRecord> winRecords;

  WinRecordState({List<WinRecord>? winRecords}) : winRecords = winRecords ?? [];

  WinRecordState copyWith({
    List<WinRecord>? winRecords,
  }) =>
      WinRecordState(
        winRecords: winRecords ?? this.winRecords,
      );
}
