// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AudioItemStruct extends FFFirebaseStruct {
  AudioItemStruct({
    String? name,
    String? path,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _path = path,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "path" field.
  String? _path;
  String get path => _path ?? '';
  set path(String? val) => _path = val;

  bool hasPath() => _path != null;

  static AudioItemStruct fromMap(Map<String, dynamic> data) => AudioItemStruct(
        name: data['name'] as String?,
        path: data['path'] as String?,
      );

  static AudioItemStruct? maybeFromMap(dynamic data) => data is Map
      ? AudioItemStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'path': _path,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'path': serializeParam(
          _path,
          ParamType.String,
        ),
      }.withoutNulls;

  static AudioItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      AudioItemStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        path: deserializeParam(
          data['path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AudioItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AudioItemStruct && name == other.name && path == other.path;
  }

  @override
  int get hashCode => const ListEquality().hash([name, path]);
}

AudioItemStruct createAudioItemStruct({
  String? name,
  String? path,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AudioItemStruct(
      name: name,
      path: path,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AudioItemStruct? updateAudioItemStruct(
  AudioItemStruct? audioItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    audioItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAudioItemStructData(
  Map<String, dynamic> firestoreData,
  AudioItemStruct? audioItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (audioItem == null) {
    return;
  }
  if (audioItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && audioItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final audioItemData = getAudioItemFirestoreData(audioItem, forFieldValue);
  final nestedData = audioItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = audioItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAudioItemFirestoreData(
  AudioItemStruct? audioItem, [
  bool forFieldValue = false,
]) {
  if (audioItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(audioItem.toMap());

  // Add any Firestore field values
  audioItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAudioItemListFirestoreData(
  List<AudioItemStruct>? audioItems,
) =>
    audioItems?.map((e) => getAudioItemFirestoreData(e, true)).toList() ?? [];
