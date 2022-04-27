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
    return BlocSelector<DifficultyBloc, DifficultyState, DifficultyOption>(
      selector: (state) => state.difficulty.option,
      builder: (context, option) {
        return BlocSelector<WinRecordBloc, WinRecordState, List<WinRecord>>(
            selector: (state) => state.winRecords,
            builder: (context, winRecords) {
              List<WinRecord> filteredWinRecords = winRecords
                  .where((element) => element.difficulty == option)
                  .sorted(((a, b) => a.score.compareTo(b.score)))
                  .take(AppConfig.winRecordShowCount)
                  .toList();

              return option != DifficultyOption.custom
                  ? DataTable(
                      dataTextStyle: Theme.of(context).textTheme.bodySmall,
                      headingTextStyle: Theme.of(context).textTheme.titleSmall,
                      columns: const [
                        DataColumn(
                            label: Text('Top ${AppConfig.winRecordShowCount}')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Time')),
                      ],
                      rows: filteredWinRecords
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
      },
    );
  }
}
