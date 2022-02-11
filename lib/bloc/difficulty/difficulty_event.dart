import 'package:minesweeper/model/difficulty_model.dart';

abstract class DifficultyEvent {}

class DifficultyUpdated {
  final Difficulty difficulty;

  DifficultyUpdated({required this.difficulty});
}
