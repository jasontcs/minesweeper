import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/bloc/timer/timer_bloc.dart';
import 'package:minesweeper/bloc/timer/timer_event.dart';
import 'package:minesweeper/service/game/game_service.dart';

import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final TimerBloc timerBloc;
  final GameService _gameService = GameService.instance;

  GameBloc({required this.timerBloc}) : super(GameInitial()) {
    on<GameStarted>((event, emit) {
      _gameService.game = MineSweeperGame.init(
        width: event.width,
        height: event.height,
        mine: event.mine,
      );
      emit(GameReady(
        boxes: _gameService.game!.boxes,
        flagLeft: _gameService.game!.flagLeft,
        width: _gameService.game!.width,
        height: _gameService.game!.height,
      ));
      timerBloc.add(TimerResetted());
      timerBloc.add(TimerStarted());
    });
    on<GameResetted>((event, emit) {
      _gameService.game = MineSweeperGame.init(
        width: _gameService.game!.width,
        height: _gameService.game!.height,
        mine: _gameService.game!.mineCount,
      );
      emit(GameReady(
        boxes: _gameService.game!.boxes,
        flagLeft: _gameService.game!.flagLeft,
        width: _gameService.game!.width,
        height: _gameService.game!.height,
      ));
      timerBloc.add(TimerResetted());
    });
    on<GameBoxOpen>((event, emit) {
      MineSweeperGame? game = _gameService.game;
      if (game != null && state is! GameEnd) {
        game.openBox(event.position);
        emit(GamePlaying(
          boxes: game.boxes,
          flagLeft: game.flagLeft,
          width: game.width,
          height: game.height,
        ));
        if (game.success == true) {
          emit(GameWin(
            boxes: game.boxes,
            flagLeft: game.flagLeft,
            width: game.width,
            height: game.height,
          ));
          timerBloc.add(TimerStopped());
        }
        if (game.success == false) {
          emit(GameLose(
            boxes: game.boxes,
            flagLeft: game.flagLeft,
            width: game.width,
            height: game.height,
          ));
          timerBloc.add(TimerStopped());
        }
      }
    });

    on<GameBoxFlag>((event, emit) {
      MineSweeperGame? game = _gameService.game;
      if (game != null && state is! GameEnd) {
        game.toggleFlag(event.position);
        emit(
          GamePlaying(
            boxes: game.boxes,
            flagLeft: game.flagLeft,
            width: game.width,
            height: game.height,
          ),
        );
      }
    });
  }
}
