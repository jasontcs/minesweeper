import 'game_model.dart';

class Difficulty extends MineBoxGameConfig {
  final String label;

  const Difficulty.beginner()
      : label = 'Beginner (9x9)',
        super(
          width: 9,
          height: 9,
          mine: 10,
        );

  const Difficulty.intermediate()
      : label = 'Intermediate (16x16)',
        super(
          width: 16,
          height: 16,
          mine: 40,
        );
  const Difficulty.expert()
      : label = 'Expert (30x96)',
        super(
          width: 30,
          height: 16,
          mine: 99,
        );

  const Difficulty.custom({
    int width = 9,
    int height = 9,
    int mine = 10,
  })  : label = 'Custom',
        super(
          height: height,
          width: width,
          mine: mine,
        );
  @override
  List<Object?> get props => super.props..add(label);
}
