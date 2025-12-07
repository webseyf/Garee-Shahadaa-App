// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BotchatsStruct extends FFFirebaseStruct {
  BotchatsStruct({
    DateTime? createdtime,
    String? createdby,
    String? message,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdtime = createdtime,
        _createdby = createdby,
        _message = message,
        super(firestoreUtilData);

  // "createdtime" field.
  DateTime? _createdtime;
  DateTime? get createdtime => _createdtime;
  set createdtime(DateTime? val) => _createdtime = val;

  bool hasCreatedtime() => _createdtime != null;

  // "createdby" field.
  String? _createdby;
  String get createdby => _createdby ?? '';
  set createdby(String? val) => _createdby = val;

  bool hasCreatedby() => _createdby != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  static BotchatsStruct fromMap(Map<String, dynamic> data) => BotchatsStruct(
        createdtime: data['createdtime'] as DateTime?,
        createdby: data['createdby'] as String?,
        message: data['message'] as String?,
      );

  static BotchatsStruct? maybeFromMap(dynamic data) =>
      data is Map ? BotchatsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'createdtime': _createdtime,
        'createdby': _createdby,
        'message': _message,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'createdtime': serializeParam(
          _createdtime,
          ParamType.DateTime,
        ),
        'createdby': serializeParam(
          _createdby,
          ParamType.String,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
      }.withoutNulls;

  static BotchatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      BotchatsStruct(
        createdtime: deserializeParam(
          data['createdtime'],
          ParamType.DateTime,
          false,
        ),
        createdby: deserializeParam(
          data['createdby'],
          ParamType.String,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'BotchatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BotchatsStruct &&
        createdtime == other.createdtime &&
        createdby == other.createdby &&
        message == other.message;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([createdtime, createdby, message]);
}

BotchatsStruct createBotchatsStruct({
  DateTime? createdtime,
  String? createdby,
  String? message,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BotchatsStruct(
      createdtime: createdtime,
      createdby: createdby,
      message: message,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BotchatsStruct? updateBotchatsStruct(
  BotchatsStruct? botchats, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    botchats
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBotchatsStructData(
  Map<String, dynamic> firestoreData,
  BotchatsStruct? botchats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (botchats == null) {
    return;
  }
  if (botchats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && botchats.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final botchatsData = getBotchatsFirestoreData(botchats, forFieldValue);
  final nestedData = botchatsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = botchats.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBotchatsFirestoreData(
  BotchatsStruct? botchats, [
  bool forFieldValue = false,
]) {
  if (botchats == null) {
    return {};
  }
  final firestoreData = mapToFirestore(botchats.toMap());

  // Add any Firestore field values
  botchats.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBotchatsListFirestoreData(
  List<BotchatsStruct>? botchatss,
) =>
    botchatss?.map((e) => getBotchatsFirestoreData(e, true)).toList() ?? [];
