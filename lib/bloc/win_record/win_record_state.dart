part of 'win_record_bloc.dart';

class WinRecordState {
  final List<WinRecord> winRecords;
  final String? playerName;

  WinRecordState({
    List<WinRecord>? winRecords,
    this.playerName,
  }) : winRecords = winRecords ?? [];

  WinRecordState copyWith({
    List<WinRecord>? winRecords,
    String? playerName,
  }) =>
      WinRecordState(
        winRecords: winRecords ?? this.winRecords,
        playerName: playerName ?? this.playerName,
      );
}
