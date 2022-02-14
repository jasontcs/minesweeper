import 'game_model.dart';

enum DifficultyOption {
  beginner,
  intermeidate,
  expert,
  custom,
}

class Difficulty extends MineBoxGameConfig {
  final String label;
  final DifficultyOption option;

  const Difficulty.beginner()
      : label = 'Beginner (9x9)',
        option = DifficultyOption.beginner,
        super(
          width: 9,
          height: 9,
          mine: 10,
        );

  const Difficulty.intermediate()
      : label = 'Intermediate (16x16)',
        option = DifficultyOption.intermeidate,
        super(
          width: 16,
          height: 16,
          mine: 40,
        );
  const Difficulty.expert()
      : label = 'Expert (30x96)',
        option = DifficultyOption.expert,
        super(
          width: 30,
          height: 16,
          mine: 99,
        );

  Difficulty.custom(
      {MineBoxGameConfig config =
          const MineBoxGameConfig(height: 9, width: 9, mine: 10)})
      : label = 'Custom',
        option = DifficultyOption.custom,
        super(
          height: config.height,
          width: config.width,
          mine: config.mine,
        );

  static Difficulty withOption(DifficultyOption option) {
    switch (option) {
      case DifficultyOption.beginner:
        return const Difficulty.beginner();
      case DifficultyOption.intermeidate:
        return const Difficulty.intermediate();
      case DifficultyOption.expert:
        return const Difficulty.expert();
      case DifficultyOption.custom:
        return Difficulty.custom();
    }
  }

  @override
  List<Object?> get props => super.props..add(label);
}
