import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
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
        BlocProvider<DifficultyBloc>(
          create: (BuildContext context) =>
              DifficultyBloc(gameBloc: BlocProvider.of<GameBloc>(context)),
        ),
      ],
      child: MaterialApp(
        home: const GameScreen(),
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.antonTextTheme(),
            chipTheme: ChipThemeData.fromDefaults(
              brightness: Brightness.light,
              secondaryColor: Theme.of(context).primaryColor,
              labelStyle: GoogleFonts.anton(),
            )),
        darkTheme: ThemeData.dark(),
      ),
    );
  }
}
