import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'createpost_widget.dart' show CreatepostWidget;
import 'package:flutter/material.dart';

class CreatepostModel extends FlutterFlowModel<CreatepostWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for posttitle widget.
  FocusNode? posttitleFocusNode;
  TextEditingController? posttitleTextController;
  String? Function(BuildContext, String?)? posttitleTextControllerValidator;
  // State field(s) for desriptionpost widget.
  FocusNode? desriptionpostFocusNode;
  TextEditingController? desriptionpostTextController;
  String? Function(BuildContext, String?)?
      desriptionpostTextControllerValidator;
  String? _desriptionpostTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'rf32xhkv' /* Share your thoughts, ask quest... */,
      );
    }

    if (val.length < 5) {
      return 'Requires at least 5 characters.';
    }
    if (val.length > 800) {
      return 'Maximum 800 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    desriptionpostTextControllerValidator =
        _desriptionpostTextControllerValidator;
  }

  @override
  void dispose() {
    posttitleFocusNode?.dispose();
    posttitleTextController?.dispose();

    desriptionpostFocusNode?.dispose();
    desriptionpostTextController?.dispose();
  }
}
