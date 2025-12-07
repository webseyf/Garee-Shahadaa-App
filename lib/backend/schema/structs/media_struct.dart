// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MediaStruct extends FFFirebaseStruct {
  MediaStruct({
    String? mediaurl,
    String? mediartist,
    String? mediatitle,
    String? mediabanner,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mediaurl = mediaurl,
        _mediartist = mediartist,
        _mediatitle = mediatitle,
        _mediabanner = mediabanner,
        super(firestoreUtilData);

  // "mediaurl" field.
  String? _mediaurl;
  String get mediaurl => _mediaurl ?? '';
  set mediaurl(String? val) => _mediaurl = val;

  bool hasMediaurl() => _mediaurl != null;

  // "mediartist" field.
  String? _mediartist;
  String get mediartist => _mediartist ?? '';
  set mediartist(String? val) => _mediartist = val;

  bool hasMediartist() => _mediartist != null;

  // "mediatitle" field.
  String? _mediatitle;
  String get mediatitle => _mediatitle ?? '';
  set mediatitle(String? val) => _mediatitle = val;

  bool hasMediatitle() => _mediatitle != null;

  // "mediabanner" field.
  String? _mediabanner;
  String get mediabanner => _mediabanner ?? '';
  set mediabanner(String? val) => _mediabanner = val;

  bool hasMediabanner() => _mediabanner != null;

  static MediaStruct fromMap(Map<String, dynamic> data) => MediaStruct(
        mediaurl: data['mediaurl'] as String?,
        mediartist: data['mediartist'] as String?,
        mediatitle: data['mediatitle'] as String?,
        mediabanner: data['mediabanner'] as String?,
      );

  static MediaStruct? maybeFromMap(dynamic data) =>
      data is Map ? MediaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'mediaurl': _mediaurl,
        'mediartist': _mediartist,
        'mediatitle': _mediatitle,
        'mediabanner': _mediabanner,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mediaurl': serializeParam(
          _mediaurl,
          ParamType.String,
        ),
        'mediartist': serializeParam(
          _mediartist,
          ParamType.String,
        ),
        'mediatitle': serializeParam(
          _mediatitle,
          ParamType.String,
        ),
        'mediabanner': serializeParam(
          _mediabanner,
          ParamType.String,
        ),
      }.withoutNulls;

  static MediaStruct fromSerializableMap(Map<String, dynamic> data) =>
      MediaStruct(
        mediaurl: deserializeParam(
          data['mediaurl'],
          ParamType.String,
          false,
        ),
        mediartist: deserializeParam(
          data['mediartist'],
          ParamType.String,
          false,
        ),
        mediatitle: deserializeParam(
          data['mediatitle'],
          ParamType.String,
          false,
        ),
        mediabanner: deserializeParam(
          data['mediabanner'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MediaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MediaStruct &&
        mediaurl == other.mediaurl &&
        mediartist == other.mediartist &&
        mediatitle == other.mediatitle &&
        mediabanner == other.mediabanner;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([mediaurl, mediartist, mediatitle, mediabanner]);
}

MediaStruct createMediaStruct({
  String? mediaurl,
  String? mediartist,
  String? mediatitle,
  String? mediabanner,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MediaStruct(
      mediaurl: mediaurl,
      mediartist: mediartist,
      mediatitle: mediatitle,
      mediabanner: mediabanner,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MediaStruct? updateMediaStruct(
  MediaStruct? media, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    media
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMediaStructData(
  Map<String, dynamic> firestoreData,
  MediaStruct? media,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (media == null) {
    return;
  }
  if (media.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && media.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final mediaData = getMediaFirestoreData(media, forFieldValue);
  final nestedData = mediaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = media.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMediaFirestoreData(
  MediaStruct? media, [
  bool forFieldValue = false,
]) {
  if (media == null) {
    return {};
  }
  final firestoreData = mapToFirestore(media.toMap());

  // Add any Firestore field values
  media.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMediaListFirestoreData(
  List<MediaStruct>? medias,
) =>
    medias?.map((e) => getMediaFirestoreData(e, true)).toList() ?? [];
