import 'game_model.dart';

class Difficulty extends MineBoxGameConfig {
  final String label;
  const Difficulty({
    required this.label,
    required int width,
    required int height,
    required int mine,
  }) : super(
          height: height,
          width: width,
          mine: mine,
        );
  @override
  List<Object?> get props => super.props..add(label);
}

class DifficultyConfig {
  static Difficulty beginner = const Difficulty(
    label: 'Beginner (9x9)',
    width: 9,
    height: 9,
    mine: 10,
  );
  static Difficulty intermediate = const Difficulty(
    label: 'Intermediate (16x16)',
    width: 16,
    height: 16,
    mine: 40,
  );
  static Difficulty expert = const Difficulty(
    label: 'Expert (30x96)',
    width: 30,
    height: 16,
    mine: 99,
  );
  static Difficulty custom = const Difficulty(
    label: 'Custom',
    width: 9,
    height: 9,
    mine: 10,
  );

  static List<Difficulty> data = [
    beginner,
    intermediate,
    expert,
    custom,
  ];
}
