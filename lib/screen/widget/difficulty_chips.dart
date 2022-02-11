import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/game_model.dart';

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
