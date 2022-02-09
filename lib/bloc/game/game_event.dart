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

class GameBoxUpdated extends GameEvent {
  final MineBoxStatus status;
  final MineBoxPosition position;

  GameBoxUpdated({required this.status, required this.position});
}
