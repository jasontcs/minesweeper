import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';

import 'minebox.dart';

class MineGameGrid extends StatelessWidget {
  const MineGameGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) {
        if (state is GameWin) {}
      },
      builder: (context, state) {
        if (state is GameActive) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              state.height,
              (indexY) => Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  state.width,
                  (indexX) => MineBoxTile(
                    side: 26,
                    box: state.boxes.singleWhere((box) {
                      return box.position.x == indexX + 1 &&
                          box.position.y == indexY + 1;
                    }),
                  ),
                ),
              ),
            ),
          );
        }
        return const Text('Not Start');
      },
    );
  }
}
