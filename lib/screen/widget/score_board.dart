import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/win_record/win_record_bloc.dart';
import 'package:minesweeper/model/win_record_model.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WinRecordBloc, WinRecordState>(
        builder: (context, state) {
      return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          WinRecord record = state.winRecords[index];
          return ListTile(
            title: Text(record.player?.name ?? '-'),
            trailing: Text(record.score.toString()),
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        itemCount: state.winRecords.length,
      );
    });
  }
}
