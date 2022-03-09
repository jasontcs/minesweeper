import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/bloc/win_record/win_record_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/game_model.dart';

import 'custom_value.dart';

class DifficultyChips extends StatelessWidget {
  const DifficultyChips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DifficultyBloc, DifficultyState>(
        builder: (context, state) {
      return Center(
        child: Column(
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
        ),
      );
    });
  }
}

class CustomDifficultyForm extends StatefulWidget {
  const CustomDifficultyForm({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDifficultyForm> createState() => _CustomDifficultyFormState();
}

class _CustomDifficultyFormState extends State<CustomDifficultyForm> {
  final _formKey = GlobalKey<FormState>();
  late MineBoxGameConfig _config;

  String? _validator(String? value) {
    if (value == null) return '';
    if (int.tryParse(value) == null) return '';
    if (!_config.isValid) return '';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DifficultyBloc, DifficultyState>(
        listener: (context, state) {
      if (state is DifficultyCustomSelected) {
        setState(() {
          _config = state.difficulty;
        });
      }
    }, builder: (context, state) {
      return Visibility(
        visible: state is DifficultyCustomSelected,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ValueField(
                    initialValue: state.difficulty.width,
                    validator: _validator,
                    onChanged: (width) {
                      setState(() {
                        _config = _config.copyWith(width: width);
                      });
                    },
                    labelText: 'Width',
                  ),
                  ValueField(
                    initialValue: state.difficulty.height,
                    validator: _validator,
                    onChanged: (height) {
                      setState(() {
                        _config = _config.copyWith(height: height);
                      });
                    },
                    labelText: 'Height',
                  ),
                  ValueField(
                    initialValue: state.difficulty.mine,
                    validator: _validator,
                    onChanged: (mine) {
                      setState(() {
                        _config = _config.copyWith(mine: mine);
                      });
                    },
                    labelText: 'Mines',
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    BlocProvider.of<DifficultyBloc>(context)
                        .add(DifficultyCustomEntered(config: _config));
                    _formKey.currentState!.save();
                  }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      );
    });
  }
}
