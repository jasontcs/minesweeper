import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';

import 'custom_form.dart';

class DifficultyChips extends StatelessWidget {
  const DifficultyChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DifficultyBloc, DifficultyState>(
        builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            children: DifficultyOption.values
                .map((option) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ChoiceChip(
                        label: Text(Difficulty.withOption(option).label),
                        selected: state.difficulty.option == option,
                        onSelected: (selected) {
                          BlocProvider.of<DifficultyBloc>(context)
                              .add(DifficultyOptionPressed(option: option));
                        },
                      ),
                    ))
                .toList(),
          ),
          const CustomDifficultyForm(),
        ],
      );
    });
  }
}
