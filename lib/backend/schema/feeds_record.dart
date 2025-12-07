import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedsRecord extends FirestoreRecord {
  FeedsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "createdat" field.
  DateTime? _createdat;
  DateTime? get createdat => _createdat;
  bool hasCreatedat() => _createdat != null;

  // "vidoelink" field.
  String? _vidoelink;
  String get vidoelink => _vidoelink ?? '';
  bool hasVidoelink() => _vidoelink != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _createdat = snapshotData['createdat'] as DateTime?;
    _vidoelink = snapshotData['vidoelink'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('feeds');

  static Stream<FeedsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedsRecord.fromSnapshot(s));

  static Future<FeedsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedsRecord.fromSnapshot(s));

  static FeedsRecord fromSnapshot(DocumentSnapshot snapshot) => FeedsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedsRecordData({
  String? title,
  DateTime? createdat,
  String? vidoelink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'createdat': createdat,
      'vidoelink': vidoelink,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedsRecordDocumentEquality implements Equality<FeedsRecord> {
  const FeedsRecordDocumentEquality();

  @override
  bool equals(FeedsRecord? e1, FeedsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.createdat == e2?.createdat &&
        e1?.vidoelink == e2?.vidoelink;
  }

  @override
  int hash(FeedsRecord? e) =>
      const ListEquality().hash([e?.title, e?.createdat, e?.vidoelink]);

  @override
  bool isValidKey(Object? o) => o is FeedsRecord;
}
