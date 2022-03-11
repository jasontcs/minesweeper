import 'package:flutter/material.dart';
import 'package:minesweeper/util/new_record_notification_listener.dart';
import 'widget/difficulty_chips.dart';
import 'widget/header.dart';
import 'widget/mine_game_grid.dart';
import 'widget/score_board.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewRecordNotificationListener(
      child: Scaffold(
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
      ),
    );
  }
}
