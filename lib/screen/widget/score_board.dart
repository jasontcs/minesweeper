import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/bloc/win_record/win_record_bloc.dart';
import 'package:minesweeper/config.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/win_record_model.dart';
import 'package:collection/collection.dart';
import 'package:minesweeper/util/util.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DifficultyBloc, DifficultyState>(
        builder: (context, difficultyState) {
      return BlocBuilder<WinRecordBloc, WinRecordState>(
          builder: (context, winRecordState) {
        DifficultyOption difficultyOption = difficultyState.difficulty.option;
        List<WinRecord> winRecords = winRecordState.winRecords
            .where((element) => element.difficulty == difficultyOption)
            .sorted(((a, b) => a.score.compareTo(b.score)))
            .take(AppConfig.winRecordShowCount)
            .toList();

        return difficultyOption != DifficultyOption.custom
            ? DataTable(
                dataTextStyle: Theme.of(context).textTheme.bodySmall,
                headingTextStyle: Theme.of(context).textTheme.titleSmall,
                columns: const [
                  DataColumn(
                      label: Text('Top ${AppConfig.winRecordShowCount}')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Time')),
                ],
                rows: winRecords
                    .mapIndexed((index, record) => DataRow(cells: [
                          DataCell(Badge(
                            child: Text('${index + 1}'),
                            showBadge: record.isNew == true,
                            padding: const EdgeInsets.all(4),
                          )),
                          DataCell(Text(record.player?.name ?? '-')),
                          DataCell(Text(formatDuration(record.score))),
                        ]))
                    .toList(),
              )
            : const Text('');
      });
    });
  }
}
