import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/game_model.dart';

abstract class DifficultyEvent {}

class DifficultyOptionPressed extends DifficultyEvent {
  final DifficultyOption option;

  DifficultyOptionPressed({required this.option});
}

class DifficultyCustomEntered extends DifficultyEvent {
  final MineBoxGameConfig config;
  DifficultyCustomEntered({required this.config});
}
