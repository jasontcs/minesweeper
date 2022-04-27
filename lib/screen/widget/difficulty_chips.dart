import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';

import 'custom_form.dart';

class DifficultyChips extends StatelessWidget {
  const DifficultyChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DifficultyBloc, DifficultyState, DifficultyOption>(
      selector: (state) => state.difficulty.option,
      builder: (context, option) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Wrap(
              children: DifficultyOption.values
                  .map((choiceOption) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                          label:
                              Text(Difficulty.withOption(choiceOption).label),
                          selected: option == choiceOption,
                          onSelected: (selected) {
                            BlocProvider.of<DifficultyBloc>(context).add(
                                DifficultyOptionPressed(option: choiceOption));
                          },
                        ),
                      ))
                  .toList(),
            ),
            const CustomDifficultyForm(),
          ],
        );
      },
    );
  }
}
