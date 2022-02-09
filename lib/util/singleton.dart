import 'package:get_it/get_it.dart';
import 'package:minesweeper/service/game/game_service.dart';
import 'package:minesweeper/service/timer/timer_service.dart';

class AppSingleton {
  static T instance<T extends Object>() => GetIt.instance.get<T>();
  static Future<void> setup() async {
    final getIt = GetIt.instance;
    getIt.registerSingletonAsync<GameService>(() async => GameService());
    getIt.registerSingletonAsync<TimerService>(() async => TimerService());
    await getIt.allReady();
  }
}
