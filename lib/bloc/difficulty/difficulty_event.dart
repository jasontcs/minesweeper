import 'package:equatable/equatable.dart';
import 'package:minesweeper/model/difficulty_model.dart';

abstract class DifficultyEvent {}

abstract class DifficultySetted extends DifficultyEvent {}

class DifficultyBeginnerPressed extends DifficultySetted {}

class DifficultyIntermediatePressed extends DifficultySetted {}

class DifficultyExpertPressed extends DifficultySetted {}

class DifficultyCustomPressed extends DifficultyEvent {}

class DifficultyCustomEntered extends DifficultySetted {
  final Difficulty difficulty;

  DifficultyCustomEntered({required this.difficulty});
}
