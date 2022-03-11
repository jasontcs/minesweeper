// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'win_record_model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class WinRecordCollectionReference
    implements
        WinRecordQuery,
        FirestoreCollectionReference<WinRecordQuerySnapshot> {
  factory WinRecordCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$WinRecordCollectionReference;

  static WinRecord fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return WinRecord.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    WinRecord value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  WinRecordDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<WinRecordDocumentReference> add(WinRecord value);
}

class _$WinRecordCollectionReference extends _$WinRecordQuery
    implements WinRecordCollectionReference {
  factory _$WinRecordCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$WinRecordCollectionReference._(
      firestore.collection('win_records').withConverter(
            fromFirestore: WinRecordCollectionReference.fromFirestore,
            toFirestore: WinRecordCollectionReference.toFirestore,
          ),
    );
  }

  _$WinRecordCollectionReference._(
    CollectionReference<WinRecord> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<WinRecord> get reference =>
      super.reference as CollectionReference<WinRecord>;

  @override
  WinRecordDocumentReference doc([String? id]) {
    return WinRecordDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<WinRecordDocumentReference> add(WinRecord value) {
    return reference.add(value).then((ref) => WinRecordDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$WinRecordCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class WinRecordDocumentReference
    extends FirestoreDocumentReference<WinRecordDocumentSnapshot> {
  factory WinRecordDocumentReference(DocumentReference<WinRecord> reference) =
      _$WinRecordDocumentReference;

  DocumentReference<WinRecord> get reference;

  /// A reference to the [WinRecordCollectionReference] containing this document.
  WinRecordCollectionReference get parent {
    return _$WinRecordCollectionReference(reference.firestore);
  }

  @override
  Stream<WinRecordDocumentSnapshot> snapshots();

  @override
  Future<WinRecordDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int score,
    String playerId,
    bool? isNew,
    List<Object?> props,
  });

  Future<void> set(WinRecord value);
}

class _$WinRecordDocumentReference
    extends FirestoreDocumentReference<WinRecordDocumentSnapshot>
    implements WinRecordDocumentReference {
  _$WinRecordDocumentReference(this.reference);

  @override
  final DocumentReference<WinRecord> reference;

  /// A reference to the [WinRecordCollectionReference] containing this document.
  WinRecordCollectionReference get parent {
    return _$WinRecordCollectionReference(reference.firestore);
  }

  @override
  Stream<WinRecordDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return WinRecordDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<WinRecordDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return WinRecordDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? score = _sentinel,
    Object? playerId = _sentinel,
    Object? isNew = _sentinel,
    Object? props = _sentinel,
  }) async {
    final json = {
      if (score != _sentinel) "score": score as int,
      if (playerId != _sentinel) "playerId": playerId as String,
      if (isNew != _sentinel) "isNew": isNew as bool?,
      if (props != _sentinel) "props": props as List<Object?>,
    };

    return reference.update(json);
  }

  Future<void> set(WinRecord value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is WinRecordDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class WinRecordDocumentSnapshot extends FirestoreDocumentSnapshot {
  WinRecordDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<WinRecord> snapshot;

  @override
  WinRecordDocumentReference get reference {
    return WinRecordDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final WinRecord? data;
}

abstract class WinRecordQuery
    implements QueryReference<WinRecordQuerySnapshot> {
  @override
  WinRecordQuery limit(int limit);

  @override
  WinRecordQuery limitToLast(int limit);

  WinRecordQuery whereScore({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  WinRecordQuery wherePlayerId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  WinRecordQuery whereIsNew({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });
  WinRecordQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  });

  WinRecordQuery orderByScore({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    WinRecordDocumentSnapshot? startAtDocument,
    WinRecordDocumentSnapshot? endAtDocument,
    WinRecordDocumentSnapshot? endBeforeDocument,
    WinRecordDocumentSnapshot? startAfterDocument,
  });

  WinRecordQuery orderByPlayerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    WinRecordDocumentSnapshot? startAtDocument,
    WinRecordDocumentSnapshot? endAtDocument,
    WinRecordDocumentSnapshot? endBeforeDocument,
    WinRecordDocumentSnapshot? startAfterDocument,
  });

  WinRecordQuery orderByIsNew({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    WinRecordDocumentSnapshot? startAtDocument,
    WinRecordDocumentSnapshot? endAtDocument,
    WinRecordDocumentSnapshot? endBeforeDocument,
    WinRecordDocumentSnapshot? startAfterDocument,
  });

  WinRecordQuery orderByProps({
    bool descending = false,
    List<Object?> startAt,
    List<Object?> startAfter,
    List<Object?> endAt,
    List<Object?> endBefore,
    WinRecordDocumentSnapshot? startAtDocument,
    WinRecordDocumentSnapshot? endAtDocument,
    WinRecordDocumentSnapshot? endBeforeDocument,
    WinRecordDocumentSnapshot? startAfterDocument,
  });
}

class _$WinRecordQuery extends QueryReference<WinRecordQuerySnapshot>
    implements WinRecordQuery {
  _$WinRecordQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<WinRecord> reference;

  WinRecordQuerySnapshot _decodeSnapshot(
    QuerySnapshot<WinRecord> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return WinRecordQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<WinRecordDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: WinRecordDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return WinRecordQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<WinRecordQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<WinRecordQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  WinRecordQuery limit(int limit) {
    return _$WinRecordQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  WinRecordQuery limitToLast(int limit) {
    return _$WinRecordQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  WinRecordQuery whereScore({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$WinRecordQuery(
      reference.where(
        'score',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  WinRecordQuery wherePlayerId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$WinRecordQuery(
      reference.where(
        'playerId',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  WinRecordQuery whereIsNew({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$WinRecordQuery(
      reference.where(
        'isNew',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  WinRecordQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  }) {
    return _$WinRecordQuery(
      reference.where(
        'props',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  WinRecordQuery orderByScore({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WinRecordDocumentSnapshot? startAtDocument,
    WinRecordDocumentSnapshot? endAtDocument,
    WinRecordDocumentSnapshot? endBeforeDocument,
    WinRecordDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('score', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$WinRecordQuery(query, _collection);
  }

  WinRecordQuery orderByPlayerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WinRecordDocumentSnapshot? startAtDocument,
    WinRecordDocumentSnapshot? endAtDocument,
    WinRecordDocumentSnapshot? endBeforeDocument,
    WinRecordDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('playerId', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$WinRecordQuery(query, _collection);
  }

  WinRecordQuery orderByIsNew({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WinRecordDocumentSnapshot? startAtDocument,
    WinRecordDocumentSnapshot? endAtDocument,
    WinRecordDocumentSnapshot? endBeforeDocument,
    WinRecordDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isNew', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$WinRecordQuery(query, _collection);
  }

  WinRecordQuery orderByProps({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    WinRecordDocumentSnapshot? startAtDocument,
    WinRecordDocumentSnapshot? endAtDocument,
    WinRecordDocumentSnapshot? endBeforeDocument,
    WinRecordDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('props', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$WinRecordQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$WinRecordQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class WinRecordQuerySnapshot
    extends FirestoreQuerySnapshot<WinRecordQueryDocumentSnapshot> {
  WinRecordQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<WinRecord> snapshot;

  @override
  final List<WinRecordQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<WinRecordDocumentSnapshot>> docChanges;
}

class WinRecordQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements WinRecordDocumentSnapshot {
  WinRecordQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<WinRecord> snapshot;

  @override
  WinRecordDocumentReference get reference {
    return WinRecordDocumentReference(snapshot.reference);
  }

  @override
  final WinRecord data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class PlayerCollectionReference
    implements PlayerQuery, FirestoreCollectionReference<PlayerQuerySnapshot> {
  factory PlayerCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$PlayerCollectionReference;

  static Player fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Player.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Player value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  PlayerDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<PlayerDocumentReference> add(Player value);
}

class _$PlayerCollectionReference extends _$PlayerQuery
    implements PlayerCollectionReference {
  factory _$PlayerCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$PlayerCollectionReference._(
      firestore.collection('players').withConverter(
            fromFirestore: PlayerCollectionReference.fromFirestore,
            toFirestore: PlayerCollectionReference.toFirestore,
          ),
    );
  }

  _$PlayerCollectionReference._(
    CollectionReference<Player> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Player> get reference =>
      super.reference as CollectionReference<Player>;

  @override
  PlayerDocumentReference doc([String? id]) {
    return PlayerDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<PlayerDocumentReference> add(Player value) {
    return reference.add(value).then((ref) => PlayerDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlayerCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class PlayerDocumentReference
    extends FirestoreDocumentReference<PlayerDocumentSnapshot> {
  factory PlayerDocumentReference(DocumentReference<Player> reference) =
      _$PlayerDocumentReference;

  DocumentReference<Player> get reference;

  /// A reference to the [PlayerCollectionReference] containing this document.
  PlayerCollectionReference get parent {
    return _$PlayerCollectionReference(reference.firestore);
  }

  @override
  Stream<PlayerDocumentSnapshot> snapshots();

  @override
  Future<PlayerDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    List<WinRecord>? winRecords,
  });

  Future<void> set(Player value);
}

class _$PlayerDocumentReference
    extends FirestoreDocumentReference<PlayerDocumentSnapshot>
    implements PlayerDocumentReference {
  _$PlayerDocumentReference(this.reference);

  @override
  final DocumentReference<Player> reference;

  /// A reference to the [PlayerCollectionReference] containing this document.
  PlayerCollectionReference get parent {
    return _$PlayerCollectionReference(reference.firestore);
  }

  @override
  Stream<PlayerDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return PlayerDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<PlayerDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return PlayerDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? name = _sentinel,
    Object? winRecords = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (winRecords != _sentinel) "winRecords": winRecords as List<WinRecord>?,
    };

    return reference.update(json);
  }

  Future<void> set(Player value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is PlayerDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class PlayerDocumentSnapshot extends FirestoreDocumentSnapshot {
  PlayerDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Player> snapshot;

  @override
  PlayerDocumentReference get reference {
    return PlayerDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Player? data;
}

abstract class PlayerQuery implements QueryReference<PlayerQuerySnapshot> {
  @override
  PlayerQuery limit(int limit);

  @override
  PlayerQuery limitToLast(int limit);

  PlayerQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  PlayerQuery whereWinRecords({
    List<WinRecord>? isEqualTo,
    List<WinRecord>? isNotEqualTo,
    List<WinRecord>? isLessThan,
    List<WinRecord>? isLessThanOrEqualTo,
    List<WinRecord>? isGreaterThan,
    List<WinRecord>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<WinRecord>? arrayContainsAny,
  });

  PlayerQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    PlayerDocumentSnapshot? startAtDocument,
    PlayerDocumentSnapshot? endAtDocument,
    PlayerDocumentSnapshot? endBeforeDocument,
    PlayerDocumentSnapshot? startAfterDocument,
  });

  PlayerQuery orderByWinRecords({
    bool descending = false,
    List<WinRecord>? startAt,
    List<WinRecord>? startAfter,
    List<WinRecord>? endAt,
    List<WinRecord>? endBefore,
    PlayerDocumentSnapshot? startAtDocument,
    PlayerDocumentSnapshot? endAtDocument,
    PlayerDocumentSnapshot? endBeforeDocument,
    PlayerDocumentSnapshot? startAfterDocument,
  });
}

class _$PlayerQuery extends QueryReference<PlayerQuerySnapshot>
    implements PlayerQuery {
  _$PlayerQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Player> reference;

  PlayerQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Player> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return PlayerQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<PlayerDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: PlayerDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return PlayerQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<PlayerQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<PlayerQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  PlayerQuery limit(int limit) {
    return _$PlayerQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  PlayerQuery limitToLast(int limit) {
    return _$PlayerQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  PlayerQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$PlayerQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  PlayerQuery whereWinRecords({
    List<WinRecord>? isEqualTo,
    List<WinRecord>? isNotEqualTo,
    List<WinRecord>? isLessThan,
    List<WinRecord>? isLessThanOrEqualTo,
    List<WinRecord>? isGreaterThan,
    List<WinRecord>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<WinRecord>? arrayContainsAny,
  }) {
    return _$PlayerQuery(
      reference.where(
        'winRecords',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  PlayerQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayerDocumentSnapshot? startAtDocument,
    PlayerDocumentSnapshot? endAtDocument,
    PlayerDocumentSnapshot? endBeforeDocument,
    PlayerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PlayerQuery(query, _collection);
  }

  PlayerQuery orderByWinRecords({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    PlayerDocumentSnapshot? startAtDocument,
    PlayerDocumentSnapshot? endAtDocument,
    PlayerDocumentSnapshot? endBeforeDocument,
    PlayerDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('winRecords', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$PlayerQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$PlayerQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class PlayerQuerySnapshot
    extends FirestoreQuerySnapshot<PlayerQueryDocumentSnapshot> {
  PlayerQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Player> snapshot;

  @override
  final List<PlayerQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<PlayerDocumentSnapshot>> docChanges;
}

class PlayerQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements PlayerDocumentSnapshot {
  PlayerQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Player> snapshot;

  @override
  PlayerDocumentReference get reference {
    return PlayerDocumentReference(snapshot.reference);
  }

  @override
  final Player data;
}

// **************************************************************************
// ValidatorGenerator
// **************************************************************************

_$assertWinRecord(WinRecord instance) {
  const Min(0).validate(instance.score, "score");
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WinRecord _$WinRecordFromJson(Map<String, dynamic> json) => $checkedCreate(
      'WinRecord',
      json,
      ($checkedConvert) {
        final val = WinRecord(
          score: $checkedConvert('score', (v) => v as int),
          createdAt: $checkedConvert('created_at',
              (v) => const TimestampConverter().fromJson(v as Timestamp)),
          difficulty: $checkedConvert(
              'difficulty', (v) => $enumDecode(_$DifficultyOptionEnumMap, v)),
          playerId: $checkedConvert('player_id', (v) => v as String),
        );
        $checkedConvert(
            'player',
            (v) => val.player =
                v == null ? null : Player.fromJson(v as Map<String, dynamic>));
        $checkedConvert('is_new', (v) => val.isNew = v as bool?);
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'playerId': 'player_id',
        'isNew': 'is_new'
      },
    );

Map<String, dynamic> _$WinRecordToJson(WinRecord instance) {
  final val = <String, dynamic>{
    'difficulty': _$DifficultyOptionEnumMap[instance.difficulty],
    'score': instance.score,
    'created_at': const TimestampConverter().toJson(instance.createdAt),
    'player_id': instance.playerId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('player', instance.player);
  writeNotNull('is_new', instance.isNew);
  return val;
}

const _$DifficultyOptionEnumMap = {
  DifficultyOption.beginner: 'beginner',
  DifficultyOption.intermeidate: 'intermeidate',
  DifficultyOption.expert: 'expert',
  DifficultyOption.custom: 'custom',
};

Player _$PlayerFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Player',
      json,
      ($checkedConvert) {
        final val = Player(
          name: $checkedConvert('name', (v) => v as String),
        );
        $checkedConvert(
            'win_records',
            (v) => val.winRecords = (v as List<dynamic>?)
                ?.map((e) => WinRecord.fromJson(e as Map<String, dynamic>))
                .toList());
        return val;
      },
      fieldKeyMap: const {'winRecords': 'win_records'},
    );

Map<String, dynamic> _$PlayerToJson(Player instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('win_records', instance.winRecords);
  return val;
}
