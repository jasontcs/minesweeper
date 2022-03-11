import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/bloc/timer/timer_bloc.dart';
import 'package:minesweeper/bloc/win_record/win_record_bloc.dart';
import 'package:minesweeper/config.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/util/dialog.dart';

import 'minebox.dart';

class MineGameGrid extends StatelessWidget {
  const MineGameGrid({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBloc, GameState>(
      listener: (context, state) async {
        if (state is GameWin &&
            context.read<DifficultyBloc>().state.difficulty.option !=
                DifficultyOption.custom) {
          String name = await AppPopUp.askName(context);
          DifficultyBloc difficultyBloc =
              BlocProvider.of<DifficultyBloc>(context);
          WinRecordBloc winRecordBloc = BlocProvider.of<WinRecordBloc>(context);
          TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
          winRecordBloc.add(
            WinRecordAdd(
                name: name,
                score: timerBloc.state.second ?? -1,
                difficultyOption: difficultyBloc.state.difficulty.option),
          );
        }
      },
      builder: (context, state) {
        if (state is GameActive) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: (AppConfig.mineboxSide * state.width).toDouble(),
              height: (AppConfig.mineboxSide * state.height).toDouble(),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: state.width),
                itemBuilder: (context, index) => MineBoxTile(
                    box: state.boxes[index], side: AppConfig.mineboxSide),
                itemCount: state.width * state.height,
              ),
            ),
          );
        }
        return const Text('Not Start');
      },
    );
  }
}
