export 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/global_key.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/game_model.dart';

part 'difficulty_event.dart';
part 'difficulty_state.dart';

class DifficultyBloc extends Bloc<DifficultyEvent, DifficultyState> {
  final GameBloc _gameBloc = BlocProvider.of<GameBloc>(AppGlobal.context);
  MineBoxGameConfig _customConfig = Difficulty.custom();

  DifficultyBloc() : super(DifficultyUpdated(const Difficulty.beginner())) {
    _gameBloc.add(GameStarted.withConfig(state.difficulty));
    void _gameStarted(Difficulty difficulty) {
      _gameBloc.add(GameStarted(
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
