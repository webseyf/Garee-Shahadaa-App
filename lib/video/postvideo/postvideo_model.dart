import '/flutter_flow/flutter_flow_util.dart';
import 'postvideo_widget.dart' show PostvideoWidget;
import 'package:flutter/material.dart';

class PostvideoModel extends FlutterFlowModel<PostvideoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'jto7ekic' /* Add title here is required */,
      );
    }

    if (val.length < 4) {
      return FFLocalizations.of(context).getText(
        'o7b656g3' /* please enter full Tilte */,
      );
    }

    return null;
  }

  // State field(s) for VideoUrl widget.
  FocusNode? videoUrlFocusNode;
  TextEditingController? videoUrlTextController;
  String? Function(BuildContext, String?)? videoUrlTextControllerValidator;
  String? _videoUrlTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e1lm6qdd' /* add video Id here is required */,
      );
    }

    if (val.length < 11) {
      return FFLocalizations.of(context).getText(
        'k09brt5m' /* minimum is 11 character */,
      );
    }
    if (val.length > 11) {
      return 'Maximum 11 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    videoUrlTextControllerValidator = _videoUrlTextControllerValidator;
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    videoUrlFocusNode?.dispose();
    videoUrlTextController?.dispose();
  }
}
