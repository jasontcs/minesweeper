import 'package:equatable/equatable.dart';

class MineBoxPosition {
  final int x;
  final int y;

  const MineBoxPosition(this.x, this.y);
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

enum MineBoxStatus {
  open,
  close,
  flag,
  wrongFlag,
  burst,
  otherBurst,
}

enum MineSweeperGameStatus {
  ready,
  playing,
  win,
  lose,
}

class MineBox {
  final MineBoxPosition position;
  final bool isMine;
  late final int number;
  MineBoxStatus status = MineBoxStatus.close;

  MineBox({
    required this.position,
    required this.isMine,
  });
}

class MineBoxGameConfig extends Equatable {
  final int width;
  final int height;
  final int mine;

  const MineBoxGameConfig({
    required this.width,
    required this.height,
    required this.mine,
  });

  @override
  List<Object?> get props => [width, height, mine];
}
