part of 'win_record_bloc.dart';

abstract class WinRecordEvent {}

class _WinRecordInit extends WinRecordEvent {}

class WinRecordAdd extends WinRecordEvent {
  final String name;
  final int score;
  final DifficultyOption difficultyOption;

  WinRecordAdd({
    required this.name,
    required this.score,
    required this.difficultyOption,
  });
}
