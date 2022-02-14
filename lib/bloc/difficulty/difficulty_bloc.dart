export 'difficulty_event.dart';
export 'difficulty_state.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/game_model.dart';

import 'difficulty_event.dart';
import 'difficulty_state.dart';

class DifficultyBloc extends Bloc<DifficultyEvent, DifficultyState> {
  final GameBloc gameBloc;
  MineBoxGameConfig _customConfig = Difficulty.custom();

  DifficultyBloc({required this.gameBloc})
      : super(DifficultyUpdated(const Difficulty.beginner())) {
    gameBloc.add(GameStarted.withConfig(state.difficulty));
    void _gameStarted(Difficulty difficulty) {
      gameBloc.add(GameStarted(
          width: difficulty.width,
          height: difficulty.height,
          mine: difficulty.mine));
    }

    on<DifficultyOptionPressed>((event, emit) {
      _gameStarted(Difficulty.withOption(event.option));
      emit(DifficultyUpdated(Difficulty.withOption(event.option)));
      if (event.option == DifficultyOption.custom) {
        emit(
            DifficultyCustomSelected(Difficulty.custom(config: _customConfig)));
      }
    });
    on<DifficultyCustomEntered>((event, emit) {
      _customConfig = event.config;
      _gameStarted(Difficulty.custom(config: _customConfig));
      emit(DifficultyCustomSelected(Difficulty.custom(config: _customConfig)));
    });
  }
}
