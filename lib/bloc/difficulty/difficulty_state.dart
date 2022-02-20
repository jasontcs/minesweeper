part of 'difficulty_bloc.dart';

abstract class DifficultyState {
  final Difficulty difficulty;
  DifficultyState(this.difficulty);
}

class DifficultyUpdated extends DifficultyState {
  DifficultyUpdated(Difficulty difficulty) : super(difficulty);
}

class DifficultyCustomSelected extends DifficultyState {
  DifficultyCustomSelected(Difficulty difficulty) : super(difficulty);
}
