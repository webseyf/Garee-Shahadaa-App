import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentsfeedRecord extends FirestoreRecord {
  CommentsfeedRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment_user" field.
  DocumentReference? _commentUser;
  DocumentReference? get commentUser => _commentUser;
  bool hasCommentUser() => _commentUser != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "comment_text" field.
  String? _commentText;
  String get commentText => _commentText ?? '';
  bool hasCommentText() => _commentText != null;

  // "comment_num" field.
  int? _commentNum;
  int get commentNum => _commentNum ?? 0;
  bool hasCommentNum() => _commentNum != null;

  // "posttype" field.
  DocumentReference? _posttype;
  DocumentReference? get posttype => _posttype;
  bool hasPosttype() => _posttype != null;

  void _initializeFields() {
    _commentUser = snapshotData['comment_user'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _commentText = snapshotData['comment_text'] as String?;
    _commentNum = castToType<int>(snapshotData['comment_num']);
    _posttype = snapshotData['posttype'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('commentsfeed');

  static Stream<CommentsfeedRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommentsfeedRecord.fromSnapshot(s));

  static Future<CommentsfeedRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommentsfeedRecord.fromSnapshot(s));

  static CommentsfeedRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommentsfeedRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommentsfeedRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommentsfeedRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommentsfeedRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommentsfeedRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommentsfeedRecordData({
  DocumentReference? commentUser,
  DateTime? createdTime,
  String? commentText,
  int? commentNum,
  DocumentReference? posttype,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment_user': commentUser,
      'created_time': createdTime,
      'comment_text': commentText,
      'comment_num': commentNum,
      'posttype': posttype,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommentsfeedRecordDocumentEquality
    implements Equality<CommentsfeedRecord> {
  const CommentsfeedRecordDocumentEquality();

  @override
  bool equals(CommentsfeedRecord? e1, CommentsfeedRecord? e2) {
    return e1?.commentUser == e2?.commentUser &&
        e1?.createdTime == e2?.createdTime &&
        e1?.commentText == e2?.commentText &&
        e1?.commentNum == e2?.commentNum &&
        e1?.posttype == e2?.posttype;
  }

  @override
  int hash(CommentsfeedRecord? e) => const ListEquality().hash([
        e?.commentUser,
        e?.createdTime,
        e?.commentText,
        e?.commentNum,
        e?.posttype
      ]);

  @override
  bool isValidKey(Object? o) => o is CommentsfeedRecord;
}
