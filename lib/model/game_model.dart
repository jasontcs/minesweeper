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

class MineBoxGameConfig with EquatableMixin {
  final int width;
  final int height;
  final int mine;

  const MineBoxGameConfig({
    required this.width,
    required this.height,
    required this.mine,
  });

  MineBoxGameConfig copyWith({
    int? width,
    int? height,
    int? mine,
  }) =>
      MineBoxGameConfig(
        width: width ?? this.width,
        height: height ?? this.height,
        mine: mine ?? this.mine,
      );

  bool get isValid => width * height > mine;

  @override
  List<Object?> get props => [width, height, mine];
}
