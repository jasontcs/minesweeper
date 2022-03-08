import 'package:firebase_auth/firebase_auth.dart';
import 'package:minesweeper/model/difficulty_model.dart';
import 'package:minesweeper/model/win_record_model.dart';
import 'package:minesweeper/util/singleton.dart';
import 'package:async/async.dart';
import 'package:stream_transform/stream_transform.dart';

class WinRecordService {
  static WinRecordService instance = AppSingleton.instance<WinRecordService>();

  String? _playerId;
  String? name;

  Future<void> login(String? name) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInAnonymously();
    _playerId = userCredential.user?.uid;
  }

  Future<void> addRecord(
      {required int score, required DifficultyOption difficulty}) async {
    if (_playerId == null) throw Exception('Not Yet Login');
    await winRecordsRef.add(WinRecord(
      score: score,
      createdAt: DateTime.now(),
      difficulty: difficulty,
      playerId: _playerId!,
    ));
  }

  Stream<List<Player>> get players =>
      playersRef.snapshots().combineLatest(winRecordsRef.snapshots(),
          (p0, WinRecordQuerySnapshot p1) {
        return p0.docs
            .map((e1) => e1.data
              ..winRecords = p1.docs
                  .where((element) => element.data.playerId == e1.id)
                  .map((e2) => e2.data..player = e1.data)
                  .toList())
            .toList();
      });

  Stream<List<WinRecord>> get winRecords => players.map((event) =>
      event.expand<WinRecord>((element) => element.winRecords ?? []).toList());
}
