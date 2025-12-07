import '/flutter_flow/flutter_flow_util.dart';
import 'commentbottomsheet_widget.dart' show CommentbottomsheetWidget;
import 'package:flutter/material.dart';

class CommentbottomsheetModel
    extends FlutterFlowModel<CommentbottomsheetWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldcomment widget.
  FocusNode? textFieldcommentFocusNode;
  TextEditingController? textFieldcommentTextController;
  String? Function(BuildContext, String?)?
      textFieldcommentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldcommentFocusNode?.dispose();
    textFieldcommentTextController?.dispose();
  }
}
