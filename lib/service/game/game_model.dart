import 'package:equatable/equatable.dart';

class MineBoxPosition extends Equatable {
  final int x;
  final int y;

  const MineBoxPosition(this.x, this.y);

  @override
  List<Object?> get props => [x, y];
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

class MineBox with EquatableMixin {
  final MineBoxPosition position;
  final bool isMine;
  late final int number;
  MineBoxStatus status = MineBoxStatus.close;

  MineBox({
    required this.position,
    required this.isMine,
  });

  @override
  List<Object?> get props => [position, isMine, number, status];
}
