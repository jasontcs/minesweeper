export 'difficulty_event.dart';
export 'difficulty_state.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';

import 'difficulty_event.dart';
import 'difficulty_state.dart';

class DifficultyBloc extends Bloc<DifficultyEvent, DifficultyState> {
  final GameBloc gameBloc;

  static List<Difficulty> options = [
    const Difficulty.beginner(),
    const Difficulty.intermediate(),
    const Difficulty.expert(),
    const Difficulty.custom(),
  ];

  DifficultyBloc({required this.gameBloc})
      : super(DifficultyUpdated(const Difficulty.beginner())) {
    void _gameStarted(Difficulty difficulty) {
      gameBloc.add(GameStarted(
          width: difficulty.width,
          height: difficulty.height,
          mine: difficulty.mine));
    }

    on<DifficultyBeginnerPressed>((event, emit) {
      _gameStarted(const Difficulty.beginner());
      emit(DifficultyUpdated(const Difficulty.beginner()));
    });
    on<DifficultyIntermediatePressed>((event, emit) {
      _gameStarted(const Difficulty.intermediate());
      emit(DifficultyUpdated(const Difficulty.intermediate()));
    });
    on<DifficultyExpertPressed>((event, emit) {
      _gameStarted(const Difficulty.expert());
      emit(DifficultyUpdated(const Difficulty.expert()));
    });
    on<DifficultyCustomPressed>((event, emit) {
      emit(DifficultyCustomSelected(const Difficulty.custom()));
    });
    on<DifficultyCustomEntered>((event, emit) {
      _gameStarted(event.difficulty);
      emit(DifficultyUpdated(event.difficulty));
    });
  }
}
