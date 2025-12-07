import '/flutter_flow/flutter_flow_util.dart';
import 'adda_audio_widget.dart' show AddaAudioWidget;
import 'package:flutter/material.dart';

class AddaAudioModel extends FlutterFlowModel<AddaAudioWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for audiotitle widget.
  FocusNode? audiotitleFocusNode;
  TextEditingController? audiotitleTextController;
  String? Function(BuildContext, String?)? audiotitleTextControllerValidator;
  String? _audiotitleTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eml11jvi' /* Add title here is required */,
      );
    }

    if (val.length < 4) {
      return FFLocalizations.of(context).getText(
        '0zzxpyas' /* please enter full Tilte */,
      );
    }

    return null;
  }

  // State field(s) for audiourl widget.
  FocusNode? audiourlFocusNode;
  TextEditingController? audiourlTextController;
  String? Function(BuildContext, String?)? audiourlTextControllerValidator;
  String? _audiourlTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        's6x10ny6' /* add video Id here is required */,
      );
    }

    if (val.length < 11) {
      return FFLocalizations.of(context).getText(
        'gdzp7m9g' /* minimum is 11 character */,
      );
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    audiotitleTextControllerValidator = _audiotitleTextControllerValidator;
    audiourlTextControllerValidator = _audiourlTextControllerValidator;
  }

  @override
  void dispose() {
    audiotitleFocusNode?.dispose();
    audiotitleTextController?.dispose();

    audiourlFocusNode?.dispose();
    audiourlTextController?.dispose();
  }
}
