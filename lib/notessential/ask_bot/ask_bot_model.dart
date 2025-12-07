import '/flutter_flow/flutter_flow_util.dart';
import 'ask_bot_widget.dart' show AskBotWidget;
import 'package:flutter/material.dart';

class AskBotModel extends FlutterFlowModel<AskBotWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - botResponses] action in IconButton widget.
  String? botResponses;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
