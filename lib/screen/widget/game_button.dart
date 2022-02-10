import 'package:flutter/material.dart';

import '../../bloc/game/game_bloc.dart';

class GameButton extends StatelessWidget {
  const GameButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: const IconThemeData(size: 60),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: const CircleBorder(),
          primary: Colors.black54,
        ),
        onPressed: () {
          BlocProvider.of<GameBloc>(context).add(GameResetted());
        },
        child: Center(
          child: BlocBuilder<GameBloc, GameState>(
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
      ),
    );
  }
}
