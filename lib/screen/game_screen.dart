import 'package:flutter/material.dart';
import 'widget/difficulty_chips.dart';
import 'widget/flag_count_down.dart';
import 'widget/game_button.dart';
import 'widget/game_stopwatch.dart';
import 'widget/mine_game_grid.dart';
import 'widget/score_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FlagCountDown(),
                  GameButton(),
                  GameStopwatch(),
                ],
              ),
              const MineGameGrid(),
              const DifficultyChips(),
              const ScoreBoard(),
            ],
          ),
        ),
      ),
    );
  }
}
