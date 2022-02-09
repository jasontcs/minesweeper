import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/service/game/game_service.dart';

import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameService _gameService = GameService.instance;

  GameBloc() : super(GameInitial()) {
    on<GameStarted>((event, emit) {
      _gameService.game = MineSweeperGame.init(
        width: event.width,
        height: event.height,
        mine: event.mine,
      );
      emit(GameInitial());
    });
    on<GameResetted>((event, emit) {
      _gameService.game = MineSweeperGame.init(
        width: _gameService.game!.width,
        height: _gameService.game!.height,
        mine: _gameService.game!.mineCount,
      );
      emit(GameInitial());
    });
    on<GameBoxUpdated>((event, emit) {
      _gameService.game
    });
  }
}
