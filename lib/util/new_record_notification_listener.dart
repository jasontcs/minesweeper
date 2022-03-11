import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minesweeper/bloc/win_record/win_record_bloc.dart';
import 'package:minesweeper/model/win_record_model.dart';
import 'package:minesweeper/util/dialog.dart';

import 'util.dart';

class NewRecordNotificationListener extends StatelessWidget {
  const NewRecordNotificationListener({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<WinRecordBloc, WinRecordState>(
      listenWhen: (previous, current) {
        List<WinRecord> newOnly(List<WinRecord> all) =>
            all.where((element) => element.isNew == true).toList();
        return !listEquals(
            newOnly(previous.winRecords), newOnly(current.winRecords));
      },
      listener: (context, state) {
        state.winRecords
            .where((element) => element.isNew == true)
            .forEach((element) async {
          AppPopUp.showSnackBar(context,
              content: Text(
                  '${element.player?.name ?? '-'} wins ${element.difficulty.name} in ${formatDuration(element.score)}'));
        });
      },
      child: child,
    );
  }
}
