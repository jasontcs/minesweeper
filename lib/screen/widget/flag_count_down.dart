import 'package:flutter/material.dart';

import '../../bloc/game/game_bloc.dart';

class FlagCountDown extends StatelessWidget {
  const FlagCountDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<GameBloc, GameState, String>(
      selector: (state) =>
          (state is GameActive ? state.flagLeft.toString() : '')
              .padLeft(3, '0'),
      builder: (context, data) => Text(
        data,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
