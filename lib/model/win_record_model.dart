import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:minesweeper/util/json_converter.dart';

import 'difficulty_model.dart';

part 'win_record_model.g.dart';

@JsonSerializable()
class WinRecord {
  final DifficultyOption difficulty;
  @Min(0)
  final int score;
  @TimestampConverter()
  final DateTime createdAt;
  final String playerId;
  Player? player;

  WinRecord({
    required this.score,
    required this.createdAt,
    required this.difficulty,
    required this.playerId,
  });
  factory WinRecord.fromJson(Map<String, Object?> json) =>
      _$WinRecordFromJson(json);

  Map<String, Object?> toJson() => _$WinRecordToJson(this);
}

@Collection<WinRecord>('win_records')
final winRecordsRef = WinRecordCollectionReference();

@JsonSerializable()
class Player {
  final String name;
  List<WinRecord>? winRecords;

  Player({
    required this.name,
  });

  factory Player.fromJson(Map<String, Object?> json) => _$PlayerFromJson(json);

  Map<String, Object?> toJson() => _$PlayerToJson(this);
}

@Collection<Player>('players')
final playersRef = PlayerCollectionReference();
