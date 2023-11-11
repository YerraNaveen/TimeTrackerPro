import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class UserTasksRecord extends FirestoreRecord {
  UserTasksRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "task_name" field.
  String? _taskName;
  String get taskName => _taskName ?? '';
  bool hasTaskName() => _taskName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "duration_in_minutes" field.
  int? _durationInMinutes;
  int get durationInMinutes => _durationInMinutes ?? 0;
  bool hasDurationInMinutes() => _durationInMinutes != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "end_time" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _taskName = snapshotData['task_name'] as String?;
    _description = snapshotData['description'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _comments = snapshotData['comments'] as String?;
    _durationInMinutes = castToType<int>(snapshotData['duration_in_minutes']);
    _startTime = snapshotData['start_time'] as DateTime?;
    _endTime = snapshotData['end_time'] as DateTime?;
    _userId = snapshotData['userId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userTasks');

  static Stream<UserTasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserTasksRecord.fromSnapshot(s));

  static Future<UserTasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserTasksRecord.fromSnapshot(s));

  static UserTasksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserTasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserTasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserTasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserTasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserTasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserTasksRecordData({
  DocumentReference? owner,
  String? taskName,
  String? description,
  DateTime? timeCreated,
  String? comments,
  int? durationInMinutes,
  DateTime? startTime,
  DateTime? endTime,
  String? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'task_name': taskName,
      'description': description,
      'time_created': timeCreated,
      'comments': comments,
      'duration_in_minutes': durationInMinutes,
      'start_time': startTime,
      'end_time': endTime,
      'userId': userId,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserTasksRecordDocumentEquality implements Equality<UserTasksRecord> {
  const UserTasksRecordDocumentEquality();

  @override
  bool equals(UserTasksRecord? e1, UserTasksRecord? e2) {
    return e1?.owner == e2?.owner &&
        e1?.taskName == e2?.taskName &&
        e1?.description == e2?.description &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.comments == e2?.comments &&
        e1?.durationInMinutes == e2?.durationInMinutes &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.userId == e2?.userId;
  }

  @override
  int hash(UserTasksRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.taskName,
        e?.description,
        e?.timeCreated,
        e?.comments,
        e?.durationInMinutes,
        e?.startTime,
        e?.endTime,
        e?.userId
      ]);

  @override
  bool isValidKey(Object? o) => o is UserTasksRecord;
}
