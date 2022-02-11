import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/model/game_model.dart';

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

class DifficultyChips extends StatefulWidget {
  const DifficultyChips({Key? key}) : super(key: key);

  @override
  State<DifficultyChips> createState() => _DifficultyChipsState();
}

class _DifficultyChipsState extends State<DifficultyChips> {
  MineBoxGameConfig customConfig = DifficultyConfig.beginner;
  Difficulty difficulty = DifficultyConfig.beginner;

  void _startGame(Difficulty difficulty) {
    context.read<GameBloc>().add(GameStarted(
        width: difficulty.width,
        height: difficulty.height,
        mine: difficulty.mine));
  }

  @override
  void initState() {
    super.initState();
    _startGame(difficulty);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          children: DifficultyConfig.data
              .map((choice) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChoiceChip(
                      label: Text(choice.label),
                      selected: difficulty == choice,
                      onSelected: (selected) {
                        if (selected) {
                          setState(() {
                            difficulty = choice;
                          });
                          if (choice != DifficultyConfig.custom) {
                            _startGame(difficulty);
                          }
                        }
                      },
                    ),
                  ))
              .toList(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 20, child: TextFormField()),
            SizedBox(width: 20, child: TextFormField()),
            SizedBox(width: 20, child: TextFormField()),
            OutlinedButton(onPressed: () {}, child: Text('Update'))
          ],
        ),
      ],
    );
  }
}
