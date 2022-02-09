import 'package:minesweeper/service/game/game_model.dart';

abstract class GameEvent {}

class GameStarted extends GameEvent {
  final int width;
  final int height;
  final int mine;

  GameStarted({
    required this.width,
    required this.height,
    required this.mine,
  });
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
