import 'package:minesweeper/model/game_model.dart';

abstract class GameEvent {}

class GameStarted extends MineBoxGameConfig implements GameEvent {
  const GameStarted({
    required int width,
    required int height,
    required int mine,
  }) : super(
          width: width,
          height: height,
          mine: mine,
        );
  static GameStarted withConfig(MineBoxGameConfig config) => GameStarted(
        width: config.width,
        height: config.height,
        mine: config.mine,
      );
}

class GameResetted extends GameEvent {}

class GameBoxOpen extends GameEvent {
  final MineBoxPosition position;

  GameBoxOpen({required this.position});
}

class GameBoxFlag extends GameEvent {
  final MineBoxPosition position;

  GameBoxFlag({required this.position});
}
