import 'package:flutter/material.dart';

import '../../bloc/game/game_bloc.dart';

class GameButton extends StatelessWidget {
  const GameButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: IconButton(
        iconSize: 60,
        onPressed: () {
          BlocProvider.of<GameBloc>(context).add(GameResetted());
        },
        icon: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is GameWin) {
              return const Icon(Icons.sentiment_very_satisfied_outlined);
            } else if (state is GameLose) {
              return const Icon(Icons.sentiment_very_dissatisfied_outlined);
            } else {
              return const Icon(Icons.sentiment_satisfied_outlined);
            }
          },
        ),
      ),
    );
  }
}
