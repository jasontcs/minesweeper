import 'package:flutter/material.dart';

import '../../bloc/game/game_bloc.dart';

class FlagCountDown extends StatelessWidget {
  const FlagCountDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) => Text(
        state is GameActive ? state.flagLeft.toString() : '-',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
