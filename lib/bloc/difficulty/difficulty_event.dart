part of 'difficulty_bloc.dart';

abstract class DifficultyEvent {}

class DifficultyOptionPressed extends DifficultyEvent {
  final DifficultyOption option;

  DifficultyOptionPressed({required this.option});
}

class DifficultyCustomEntered extends DifficultyEvent {
  final MineBoxGameConfig config;
  DifficultyCustomEntered({required this.config});
}
