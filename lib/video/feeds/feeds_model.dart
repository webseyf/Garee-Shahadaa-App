import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'feeds_widget.dart' show FeedsWidget;
import 'package:flutter/material.dart';

class FeedsModel extends FlutterFlowModel<FeedsWidget> {
  /// Query cache managers for this widget.

  final _mnjjManager = StreamRequestManager<List<FeedsRecord>>();
  Stream<List<FeedsRecord>> mnjj({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<FeedsRecord>> Function() requestFn,
  }) =>
      _mnjjManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMnjjCache() => _mnjjManager.clear();
  void clearMnjjCacheKey(String? uniqueKey) =>
      _mnjjManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearMnjjCache();
  }
}
