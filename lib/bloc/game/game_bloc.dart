export 'game_event.dart';
export 'game_state.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

import 'package:minesweeper/bloc/timer/timer_bloc.dart';
import 'package:minesweeper/model/game_model.dart';
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
      timerBloc.add(TimerStopped());
      timerBloc.add(TimerResetted());
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
      timerBloc.add(TimerStopped());
      timerBloc.add(TimerResetted());
    });
    on<GameBoxOpen>((event, emit) {
      MineSweeperGame? game = _gameService.game;
      if (game != null && state is! GameEnd) {
        timerBloc.add(TimerStarted());
        game.openBox(event.position);
        emit(GamePlaying(
          boxes: game.boxes,
          flagLeft: game.flagLeft,
          width: game.width,
          height: game.height,
        ));
        if (game.status == MineSweeperGameStatus.win) {
          emit(GameWin(
            boxes: game.boxes,
            flagLeft: game.flagLeft,
            width: game.width,
            height: game.height,
          ));
          timerBloc.add(TimerStopped());
        }
        if (game.status == MineSweeperGameStatus.lose) {
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
        timerBloc.add(TimerStarted());
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
