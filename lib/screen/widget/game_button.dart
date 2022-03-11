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
            String imageUrl;
            if (state is GameWin) {
              imageUrl = 'asset/win.png';
            } else if (state is GameLose) {
              imageUrl = 'asset/lose.png';
            } else {
              imageUrl = 'asset/playing.png';
            }
            return CircleAvatar(backgroundImage: Image.asset(imageUrl).image);
          },
        ),
      ),
    );
  }
}
