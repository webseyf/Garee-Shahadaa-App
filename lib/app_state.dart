import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _guestaccount = prefs.getString('ff_guestaccount')?.ref ?? _guestaccount;
    });
    _safeInit(() {
      _chatmessages = prefs
              .getStringList('ff_chatmessages')
              ?.map((x) {
                try {
                  return BotchatsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _chatmessages;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentMedia')) {
        try {
          final serializedData = prefs.getString('ff_currentMedia') ?? '{}';
          _currentMedia =
              MediaStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _dummyMedia = prefs
              .getStringList('ff_dummyMedia')
              ?.map((x) {
                try {
                  return MediaStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _dummyMedia;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _guestaccount;
  DocumentReference? get guestaccount => _guestaccount;
  set guestaccount(DocumentReference? value) {
    _guestaccount = value;
    value != null
        ? prefs.setString('ff_guestaccount', value.path)
        : prefs.remove('ff_guestaccount');
  }

  List<BotchatsStruct> _chatmessages = [];
  List<BotchatsStruct> get chatmessages => _chatmessages;
  set chatmessages(List<BotchatsStruct> value) {
    _chatmessages = value;
    prefs.setStringList(
        'ff_chatmessages', value.map((x) => x.serialize()).toList());
  }

  void addToChatmessages(BotchatsStruct value) {
    chatmessages.add(value);
    prefs.setStringList(
        'ff_chatmessages', _chatmessages.map((x) => x.serialize()).toList());
  }

  void removeFromChatmessages(BotchatsStruct value) {
    chatmessages.remove(value);
    prefs.setStringList(
        'ff_chatmessages', _chatmessages.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromChatmessages(int index) {
    chatmessages.removeAt(index);
    prefs.setStringList(
        'ff_chatmessages', _chatmessages.map((x) => x.serialize()).toList());
  }

  void updateChatmessagesAtIndex(
    int index,
    BotchatsStruct Function(BotchatsStruct) updateFn,
  ) {
    chatmessages[index] = updateFn(_chatmessages[index]);
    prefs.setStringList(
        'ff_chatmessages', _chatmessages.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInChatmessages(int index, BotchatsStruct value) {
    chatmessages.insert(index, value);
    prefs.setStringList(
        'ff_chatmessages', _chatmessages.map((x) => x.serialize()).toList());
  }

  MediaStruct _currentMedia = MediaStruct();
  MediaStruct get currentMedia => _currentMedia;
  set currentMedia(MediaStruct value) {
    _currentMedia = value;
    prefs.setString('ff_currentMedia', value.serialize());
  }

  void updateCurrentMediaStruct(Function(MediaStruct) updateFn) {
    updateFn(_currentMedia);
    prefs.setString('ff_currentMedia', _currentMedia.serialize());
  }

  List<MediaStruct> _dummyMedia = [];
  List<MediaStruct> get dummyMedia => _dummyMedia;
  set dummyMedia(List<MediaStruct> value) {
    _dummyMedia = value;
    prefs.setStringList(
        'ff_dummyMedia', value.map((x) => x.serialize()).toList());
  }

  void addToDummyMedia(MediaStruct value) {
    dummyMedia.add(value);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  void removeFromDummyMedia(MediaStruct value) {
    dummyMedia.remove(value);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDummyMedia(int index) {
    dummyMedia.removeAt(index);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  void updateDummyMediaAtIndex(
    int index,
    MediaStruct Function(MediaStruct) updateFn,
  ) {
    dummyMedia[index] = updateFn(_dummyMedia[index]);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDummyMedia(int index, MediaStruct value) {
    dummyMedia.insert(index, value);
    prefs.setStringList(
        'ff_dummyMedia', _dummyMedia.map((x) => x.serialize()).toList());
  }

  List<AudioItemStruct> _audioList = [];
  List<AudioItemStruct> get audioList => _audioList;
  set audioList(List<AudioItemStruct> value) {
    _audioList = value;
  }

  void addToAudioList(AudioItemStruct value) {
    audioList.add(value);
  }

  void removeFromAudioList(AudioItemStruct value) {
    audioList.remove(value);
  }

  void removeAtIndexFromAudioList(int index) {
    audioList.removeAt(index);
  }

  void updateAudioListAtIndex(
    int index,
    AudioItemStruct Function(AudioItemStruct) updateFn,
  ) {
    audioList[index] = updateFn(_audioList[index]);
  }

  void insertAtIndexInAudioList(int index, AudioItemStruct value) {
    audioList.insert(index, value);
  }

  String _currentAudioPath = '';
  String get currentAudioPath => _currentAudioPath;
  set currentAudioPath(String value) {
    _currentAudioPath = value;
  }

  bool _likingstate = false;
  bool get likingstate => _likingstate;
  set likingstate(bool value) {
    _likingstate = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
