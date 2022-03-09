import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/bloc/win_record/win_record_bloc.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/win_record_model.dart';
import 'package:collection/collection.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(fontWeight: FontWeight.normal),
      child: BlocBuilder<DifficultyBloc, DifficultyState>(
          builder: (context, difficultyState) {
        return BlocBuilder<WinRecordBloc, WinRecordState>(
            builder: (context, winRecordState) {
          DifficultyOption difficultyOption = difficultyState.difficulty.option;
          List<WinRecord> winRecords = winRecordState.winRecords
              .where((element) => element.difficulty == difficultyOption)
              .sorted(((a, b) => a.score.compareTo(b.score)))
              .take(10)
              .toList();

          String formatDuration(int totalSeconds) {
            final duration = Duration(seconds: totalSeconds);
            final minutes = duration.inMinutes;
            final seconds = totalSeconds % 60;
            return minutes > 0 ? '$minutes m $seconds s' : '$seconds s';
          }

          return difficultyOption != DifficultyOption.custom
              ? DataTable(
                  dataTextStyle: const TextStyle(fontWeight: FontWeight.normal),
                  headingTextStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  columns: const [
                    DataColumn(label: Text('Rank')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Time')),
                  ],
                  rows: winRecords
                      .mapIndexed((index, record) => DataRow(cells: [
                            DataCell(Text('${index + 1}')),
                            DataCell(Text(record.player?.name ?? '-')),
                            DataCell(Text(formatDuration(record.score))),
                          ]))
                      .toList(),
                )
              : const Text('Not Available');
        });
      }),
    );
  }
}
