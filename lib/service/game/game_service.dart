import 'dart:math';

import 'package:minesweeper/util/singleton.dart';

import 'game_model.dart';

class GameService {
  static GameService instance = AppSingleton.instance<GameService>();

  MineSweeperGame? game;
}

class MineSweeperGame {
  final MineBoxPosition _boundary;

  int get width => _boundary.x;
  int get height => _boundary.y;
  int get area => width * height;
  int get mineCount => _mines.length;

  late final List<MineBox> boxes;
  late final List<int> _mines;

  MineBoxPosition? _indexToPosition(int index) {
    if (index < area) {
      int y = index ~/ width + 1;
      int x = index % width + 1;
      return MineBoxPosition(x, y);
    }
  }

  int? _positionToIndex(MineBoxPosition position) {
    if (position.x <= _boundary.x && position.y <= _boundary.y) {
      return (position.y - 1) * width + (position.x - 1);
    }
  }

  bool _isPositionValid(MineBoxPosition position) =>
      position.x > 0 &&
      position.x <= width &&
      position.y > 0 &&
      position.y <= height;

  MineBox? mineBox(MineBoxPosition position) {
    if (_isPositionValid(position)) {
      return boxes[_positionToIndex(position)!];
    }
  }

  MineSweeperGame.init({
    required int width,
    required int height,
    required int mine,
  })  : assert(width > 0),
        assert(height > 0),
        assert(mine > 0),
        assert(mine < width * height),
        _boundary = MineBoxPosition(width, height) {
    Random random = Random();
    _mines = List.generate(mine, (index) => random.nextInt(area - 1));
    boxes = List.generate(
      area,
      (index) => MineBox(
        position: _indexToPosition(index)!,
        isMine: _mines.contains(index),
      ),
    );
    for (MineBox box in boxes) {
      box.number = MineBoxRelativePosition.values.fold<int>(0,
          (previousValue, relativePosition) {
        MineBoxPosition neighbourPosition =
            MineSweeperGameUtil.neighbourPosition(
                box.position, relativePosition);
        if (_isPositionValid(neighbourPosition) &&
            mineBox(neighbourPosition)!.isMine) {
          return ++previousValue;
        }
        return previousValue;
      });
    }
  }

  MineBox? toggleFlag(MineBoxPosition position) {
    MineBox? box = mineBox(position);
    if (box != null) {
      if (box.status == MineBoxStatus.close) {
        box.status = MineBoxStatus.flag;
      } else if (box.status == MineBoxStatus.flag) {
        box.status = MineBoxStatus.close;
      }
      return box;
    }
  }

  List<MineBox>? openBox(MineBoxPosition position) {
    MineBox? box = mineBox(position);
    if (box != null) {}
  }
}

class MineSweeperGameUtil {
  static MineBoxPosition neighbourPosition(
      MineBoxPosition position, MineBoxRelativePosition relativePosition) {
    int relativeX = position.x;
    int relativeY = position.y;
    if (relativePosition == MineBoxRelativePosition.topLeft ||
        relativePosition == MineBoxRelativePosition.left ||
        relativePosition == MineBoxRelativePosition.bottomLeft) {
      relativeX--;
    } else if ((relativePosition == MineBoxRelativePosition.topRight ||
        relativePosition == MineBoxRelativePosition.right ||
        relativePosition == MineBoxRelativePosition.bottomRight)) {
      relativeX++;
    }

    if (relativePosition == MineBoxRelativePosition.topLeft ||
        relativePosition == MineBoxRelativePosition.top ||
        relativePosition == MineBoxRelativePosition.topRight) {
      relativeY++;
    } else if ((relativePosition == MineBoxRelativePosition.bottomLeft ||
        relativePosition == MineBoxRelativePosition.bottom ||
        relativePosition == MineBoxRelativePosition.bottomRight)) {
      relativeY--;
    }

    return MineBoxPosition(relativeX, relativeY);
  }
}
