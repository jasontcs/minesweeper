import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/util/dialog.dart';

import 'widget/difficulty_chips.dart';
import 'widget/flag_count_down.dart';
import 'widget/game_button.dart';
import 'widget/game_stopwatch.dart';
import 'widget/mine_game_grid.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: IntrinsicWidth(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(child: FlagCountDown()),
                    GameButton(),
                    Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: GameStopwatch()),
                    ),
                  ],
                ),
                const MineGameGrid(),
                const DifficultyChips(),
                ElevatedButton(
                  onPressed: () async {
                    await AppDialog.askName(context);
                    UserCredential userCredential =
                        await FirebaseAuth.instance.signInAnonymously();
                    print(userCredential);
                  },
                  child: Text('data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
