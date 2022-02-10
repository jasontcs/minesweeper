import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/model/game_model.dart';

class Difficulty extends MineBoxGameConfig {
  final String label;

  const Difficulty.beginner()
      : label = 'Beginner (9x9)',
        super(height: 9, width: 9, mine: 10);
  const Difficulty.intermediate()
      : label = 'Intermediate (16x16)',
        super(height: 16, width: 16, mine: 40);
  const Difficulty.expert()
      : label = 'Expert (30x9)',
        super(height: 16, width: 30, mine: 99);
  const Difficulty.custom({
    required int width,
    required int height,
    required int mine,
  })  : label = 'Custom',
        super(height: height, width: width, mine: mine);
  @override
  List<Object?> get props => super.props..add(label);
}

class DifficultyChips extends StatefulWidget {
  const DifficultyChips({Key? key}) : super(key: key);

  @override
  State<DifficultyChips> createState() => _DifficultyChipsState();
}

class _DifficultyChipsState extends State<DifficultyChips> {
  MineBoxGameConfig customConfig = const Difficulty.beginner();
  late List<Difficulty> choices = [
    const Difficulty.beginner(),
    const Difficulty.intermediate(),
    const Difficulty.expert(),
    Difficulty.custom(
      width: customConfig.width,
      height: customConfig.height,
      mine: customConfig.mine,
    ),
  ];
  Difficulty difficulty = const Difficulty.beginner();

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
    return Wrap(
      children: choices
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
                      _startGame(difficulty);
                    }
                  },
                ),
              ))
          .toList(),
    );
  }
}
