import 'package:flutter/material.dart';

import 'flag_count_down.dart';
import 'game_button.dart';
import 'game_stopwatch.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: const [
        FlagCountDown(),
        GameButton(),
        GameStopwatch(),
      ],
    );
  }
}
