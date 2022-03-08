import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/bloc/timer/timer_bloc.dart';
import 'package:minesweeper/bloc/win_record/win_record_bloc.dart';
import 'package:minesweeper/util/dialog.dart';

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
                  String name = await AppDialog.askName(context);
                  DifficultyBloc difficultyBloc =
                      BlocProvider.of<DifficultyBloc>(context);
                  WinRecordBloc winRecordBloc =
                      BlocProvider.of<WinRecordBloc>(context);
                  TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
                  winRecordBloc.add(WinRecordAdd(
                      score: timerBloc.state.second ?? -1,
                      difficultyOption:
                          difficultyBloc.state.difficulty.option));
                },
                child: Text('data'),
              ),
              const ScoreBoard(),
            ],
          ),
        ),
      ),
    );
  }
}
