// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FeedsStruct extends FFFirebaseStruct {
  FeedsStruct({
    String? title,
    String? videourl,
    DateTime? index,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _videourl = videourl,
        _index = index,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "videourl" field.
  String? _videourl;
  String get videourl => _videourl ?? '';
  set videourl(String? val) => _videourl = val;

  bool hasVideourl() => _videourl != null;

  // "index" field.
  DateTime? _index;
  DateTime? get index => _index;
  set index(DateTime? val) => _index = val;

  bool hasIndex() => _index != null;

  static FeedsStruct fromMap(Map<String, dynamic> data) => FeedsStruct(
        title: data['title'] as String?,
        videourl: data['videourl'] as String?,
        index: data['index'] as DateTime?,
      );

  static FeedsStruct? maybeFromMap(dynamic data) =>
      data is Map ? FeedsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'videourl': _videourl,
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'videourl': serializeParam(
          _videourl,
          ParamType.String,
        ),
        'index': serializeParam(
          _index,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static FeedsStruct fromSerializableMap(Map<String, dynamic> data) =>
      FeedsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        videourl: deserializeParam(
          data['videourl'],
          ParamType.String,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'FeedsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FeedsStruct &&
        title == other.title &&
        videourl == other.videourl &&
        index == other.index;
  }

  @override
  int get hashCode => const ListEquality().hash([title, videourl, index]);
}

FeedsStruct createFeedsStruct({
  String? title,
  String? videourl,
  DateTime? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FeedsStruct(
      title: title,
      videourl: videourl,
      index: index,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FeedsStruct? updateFeedsStruct(
  FeedsStruct? feeds, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    feeds
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFeedsStructData(
  Map<String, dynamic> firestoreData,
  FeedsStruct? feeds,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (feeds == null) {
    return;
  }
  if (feeds.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && feeds.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final feedsData = getFeedsFirestoreData(feeds, forFieldValue);
  final nestedData = feedsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = feeds.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFeedsFirestoreData(
  FeedsStruct? feeds, [
  bool forFieldValue = false,
]) {
  if (feeds == null) {
    return {};
  }
  final firestoreData = mapToFirestore(feeds.toMap());

  // Add any Firestore field values
  feeds.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFeedsListFirestoreData(
  List<FeedsStruct>? feedss,
) =>
    feedss?.map((e) => getFeedsFirestoreData(e, true)).toList() ?? [];
