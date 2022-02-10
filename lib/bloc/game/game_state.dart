import 'package:minesweeper/model/game_model.dart';

abstract class GameState {}

class GameInitial extends GameState {}

abstract class GameActive extends GameState {
  final List<MineBox> boxes;
  final int flagLeft;
  final int width;
  final int height;

  GameActive({
    required this.boxes,
    required this.flagLeft,
    required this.width,
    required this.height,
  });
}

class GameReady extends GameActive {
  GameReady(
      {required List<MineBox> boxes,
      required int flagLeft,
      required int width,
      required int height})
      : super(boxes: boxes, flagLeft: flagLeft, width: width, height: height);
}

class GamePlaying extends GameActive {
  GamePlaying(
      {required List<MineBox> boxes,
      required int flagLeft,
      required int width,
      required int height})
      : super(boxes: boxes, flagLeft: flagLeft, width: width, height: height);
}

abstract class GameEnd extends GameActive {
  GameEnd(
      {required List<MineBox> boxes,
      required int flagLeft,
      required int width,
      required int height})
      : super(boxes: boxes, flagLeft: flagLeft, width: width, height: height);
}

class GameWin extends GameEnd {
  GameWin(
      {required List<MineBox> boxes,
      required int flagLeft,
      required int width,
      required int height})
      : super(boxes: boxes, flagLeft: flagLeft, width: width, height: height);
}

class GameLose extends GameEnd {
  GameLose(
      {required List<MineBox> boxes,
      required int flagLeft,
      required int width,
      required int height})
      : super(boxes: boxes, flagLeft: flagLeft, width: width, height: height);
}
