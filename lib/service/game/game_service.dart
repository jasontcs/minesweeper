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

  bool? _success;
  bool? get success => _success;

  int get flagCount =>
      boxes.where((box) => box.status == MineBoxStatus.flag).length;

  int get flagLeft => mineCount - flagCount;

  MineBoxPosition? _indexToPosition(int index) {
    if (index < area) {
      int y = index ~/ width + 1;
      int x = index % width + 1;
      return MineBoxPosition(x, y);
    }
    return null;
  }

  int? _positionToIndex(MineBoxPosition position) {
    if (position.x <= _boundary.x && position.y <= _boundary.y) {
      return (position.y - 1) * width + (position.x - 1);
    }
    return null;
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
    return null;
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
    _mines = MineSweeperGameUtil.random(width * height, mine);
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

  void toggleFlag(MineBoxPosition position) {
    MineBox? box = mineBox(position);
    if (box != null) {
      if (box.status == MineBoxStatus.close) {
        box.status = MineBoxStatus.flag;
      } else if (box.status == MineBoxStatus.flag) {
        box.status = MineBoxStatus.close;
      }
    }
  }

  void openBox(MineBoxPosition position) {
    MineBox? box = mineBox(position);
    if (box != null && box.status == MineBoxStatus.close) {
      if (box.isMine) {
        box.status = MineBoxStatus.burst;
        _burstOther();
        _checkFlag();
        _success = false;
      } else {
        box.status = MineBoxStatus.open;

        _openZeroNeighbour(box);
        if (boxes.where((box) => box.status == MineBoxStatus.open).length ==
            boxes.length - _mines.length) {
          _success = true;
        }
      }
    }
  }

  void _openZeroNeighbour(MineBox box) {
    if (!box.isMine) {
      List<MineBoxRelativePosition> positionToBeCheckAndOpen = [
        MineBoxRelativePosition.top,
        MineBoxRelativePosition.bottom,
        MineBoxRelativePosition.left,
        MineBoxRelativePosition.right,
      ];
      for (MineBoxRelativePosition relativePosition
          in positionToBeCheckAndOpen) {
        MineBoxPosition neighbourPosition =
            MineSweeperGameUtil.neighbourPosition(
                box.position, relativePosition);
        if (box.number == 0 ||
            mineBox(neighbourPosition)?.number == 0 &&
                mineBox(neighbourPosition)?.isMine == false) {
          openBox(neighbourPosition);
        }
      }
    }
  }

  void _burstOther() {
    for (MineBox box in boxes) {
      if (box.isMine && box.status == MineBoxStatus.close) {
        box.status = MineBoxStatus.otherBurst;
      }
    }
  }

  void _checkFlag() {
    for (MineBox box in boxes) {
      if (!box.isMine && box.status == MineBoxStatus.flag) {
        box.status = MineBoxStatus.wrongFlag;
      }
    }
  }
}

class MineSweeperGameUtil {
  static List<int> random(int area, int mine) {
    List<int> result = List.generate(area, (i) => i);
    result.shuffle();
    return result.take(mine).toList();
  }

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
