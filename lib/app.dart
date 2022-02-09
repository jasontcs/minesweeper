import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/bloc/timer/timer_bloc.dart';

import 'screen/game_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimerBloc>(
          create: (BuildContext context) => TimerBloc(),
        ),
        BlocProvider<GameBloc>(
          create: (BuildContext context) =>
              GameBloc(timerBloc: BlocProvider.of<TimerBloc>(context)),
        ),
      ],
      child: const MaterialApp(
        home: GameScreen(),
      ),
    );
  }
}
