import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'postlists_widget.dart' show PostlistsWidget;
import 'package:flutter/material.dart';

class PostlistsModel extends FlutterFlowModel<PostlistsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<ChatsRecord>? users1;
  // Stores action output result for [Backend Call - Create Document] action in Text widget.
  ChatsRecord? newChats1;

  /// Query cache managers for this widget.

  final _jyjhManager = StreamRequestManager<List<PostsRecord>>();
  Stream<List<PostsRecord>> jyjh({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<PostsRecord>> Function() requestFn,
  }) =>
      _jyjhManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearJyjhCache() => _jyjhManager.clear();
  void clearJyjhCacheKey(String? uniqueKey) =>
      _jyjhManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearJyjhCache();
  }
}
