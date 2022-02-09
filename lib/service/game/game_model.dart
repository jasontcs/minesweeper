import 'dart:math';

import 'package:flutter/material.dart';

class MineBoxPosition {
  final int x;
  final int y;

  MineBoxPosition(this.x, this.y);
}

class MineSweeperGame {
  final MineBoxPosition _boundary;

  int get width => _boundary.x;
  int get height => _boundary.y;
  int get area => width * height;

  late final List<MineBox> _boxes;
  late final List<int> _mines;

  MineBoxPosition? _indexToPosition(int index) {
    if (index < area) {
      int y = index ~/ height;
      int x = index % width;
      return MineBoxPosition(x, y);
    }
  }

  int? _positionToIndex(MineBoxPosition position) {
    if (position.x <= _boundary.x && position.y <= _boundary.y) {
      return (position.y - 1) * position.x;
    }
  }

  bool isPositionValid(MineBoxPosition position) =>
      position.x > 0 &&
      position.x <= width &&
      position.y > 0 &&
      position.y <= height;

  MineBox? mineBox(MineBoxPosition position) {
    if (isPositionValid(position)) {
      return _boxes[_positionToIndex(position)!];
    }
  }

  MineBox? neighbour(MineBox box, MineBoxRelativePosition relativePosition) {
    int relativeX = box.position.x;
    int relativeY = box.position.y;
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

    return mineBox(MineBoxPosition(relativeX, relativeY));
  }

  MineSweeperGame.init({
    required int width,
    required int height,
    required int mine,
  })  : assert(width > 0),
        assert(height > 0),
        assert(mine > 0),
        assert(mine > width * height),
        _boundary = MineBoxPosition(width, height) {
    Random random = Random();
    _mines = List.generate(mine, (index) => random.nextInt(area - 1));
    _boxes = List.generate(
      area,
      (index) => MineBox(
        position: _indexToPosition(index)!,
        isMine: _mines.contains(index),
      ),
    );
  }
}

enum MineBoxRelativePosition {
  topLeft,
  top,
  topRight,
  left,
  right,
  bottomLeft,
  bottom,
  bottomRight,
}

class MineBox {
  final MineBoxPosition position;
  final bool isMine;

  MineBox({
    required this.position,
    required this.isMine,
  });
}
