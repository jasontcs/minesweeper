import 'package:get_it/get_it.dart';
import 'package:minesweeper/global_key.dart';
import 'package:minesweeper/service/game/game_service.dart';
import 'package:minesweeper/service/timer/timer_service.dart';
import 'package:minesweeper/service/win_record/win_record_service.dart';

class AppSingleton {
  static T instance<T extends Object>() => GetIt.instance.get<T>();
  static Future<void> setup() async {
    final getIt = GetIt.instance;
    getIt.registerSingletonAsync<GameService>(() async => GameService());
    getIt.registerSingletonAsync<TimerService>(() async => TimerService());
    getIt.registerSingletonAsync<AppGlobal>(() async => AppGlobal());
    getIt.registerSingletonAsync<WinRecordService>(
        () async => WinRecordService());
    await getIt.allReady();
  }
}
