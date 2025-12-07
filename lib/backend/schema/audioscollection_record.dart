import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AudioscollectionRecord extends FirestoreRecord {
  AudioscollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "AudioName" field.
  String? _audioName;
  String get audioName => _audioName ?? '';
  bool hasAudioName() => _audioName != null;

  // "audiopath" field.
  String? _audiopath;
  String get audiopath => _audiopath ?? '';
  bool hasAudiopath() => _audiopath != null;

  void _initializeFields() {
    _audioName = snapshotData['AudioName'] as String?;
    _audiopath = snapshotData['audiopath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('audioscollection');

  static Stream<AudioscollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AudioscollectionRecord.fromSnapshot(s));

  static Future<AudioscollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AudioscollectionRecord.fromSnapshot(s));

  static AudioscollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AudioscollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AudioscollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AudioscollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AudioscollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AudioscollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAudioscollectionRecordData({
  String? audioName,
  String? audiopath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'AudioName': audioName,
      'audiopath': audiopath,
    }.withoutNulls,
  );

  return firestoreData;
}

class AudioscollectionRecordDocumentEquality
    implements Equality<AudioscollectionRecord> {
  const AudioscollectionRecordDocumentEquality();

  @override
  bool equals(AudioscollectionRecord? e1, AudioscollectionRecord? e2) {
    return e1?.audioName == e2?.audioName && e1?.audiopath == e2?.audiopath;
  }

  @override
  int hash(AudioscollectionRecord? e) =>
      const ListEquality().hash([e?.audioName, e?.audiopath]);

  @override
  bool isValidKey(Object? o) => o is AudioscollectionRecord;
}
