import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/game_model.dart';

class DifficultyChips extends StatefulWidget {
  const DifficultyChips({Key? key}) : super(key: key);

  @override
  State<DifficultyChips> createState() => _DifficultyChipsState();
}

class _DifficultyChipsState extends State<DifficultyChips> {
  void _startGame(Difficulty difficulty) {
    context.read<GameBloc>().add(GameStarted(
        width: difficulty.width,
        height: difficulty.height,
        mine: difficulty.mine));
  }

  @override
  void initState() {
    super.initState();
    _startGame(context.read<DifficultyBloc>().state.difficulty);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DifficultyBloc, DifficultyState>(
        builder: (context, state) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              children: DifficultyBloc.options
                  .map((option) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                          label: Text(option.label),
                          selected: state.difficulty == option,
                          onSelected: (selected) {
                            if (selected) {
                              if (option == DifficultyConfig.custom) {
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
        ),
      );
    });
  }
}
