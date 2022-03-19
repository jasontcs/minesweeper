import 'package:flutter/material.dart';
import 'widget/difficulty_chips.dart';
import 'widget/header.dart';
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
            children: const [
              AppHeader(),
              MineGameGrid(),
              DifficultyChips(),
              ScoreBoard(),
            ],
          ),
        ),
      ),
    );
  }
}
