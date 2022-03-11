import 'package:flutter/material.dart';

import '../../bloc/timer/timer_bloc.dart';

class GameStopwatch extends StatelessWidget {
  const GameStopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (context, state) => Text(
        '${state.second}'.padLeft(3, '0'),
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
