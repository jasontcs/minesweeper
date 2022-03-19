import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minesweeper/bloc/difficulty/difficulty_bloc.dart';
import 'package:minesweeper/bloc/game/game_bloc.dart';
import 'package:minesweeper/bloc/timer/timer_bloc.dart';
import 'package:minesweeper/bloc/win_record/win_record_bloc.dart';

import 'global_key.dart';
import 'screen/game_screen.dart';
import 'util/new_record_notification_listener.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimerBloc>(create: (_) => TimerBloc()),
        BlocProvider<GameBloc>(create: (_) => GameBloc()),
        BlocProvider<DifficultyBloc>(create: (_) => DifficultyBloc()),
        BlocProvider<WinRecordBloc>(create: (_) => WinRecordBloc()),
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
          ),
          snackBarTheme: SnackBarThemeData(
            contentTextStyle:
                GoogleFonts.anton(color: Theme.of(context).canvasColor),
            // actionTextColor: Theme.of(context).primaryColorLight,
          ),
        ),
        darkTheme: ThemeData.dark(),
        navigatorKey: AppGlobal.navigatorKey,
        scaffoldMessengerKey: AppGlobal.messengerKey,
        builder: (context, child) =>
            NewRecordNotificationListener(child: child),
      ),
    );
  }
}
