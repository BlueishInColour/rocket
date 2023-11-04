import 'package:flutter/material.dart';
import 'package:flutter_rte/flutter_rte.dart';

class RteQuill extends StatefulWidget {
  const RteQuill({super.key});

  @override
  State<RteQuill> createState() => RteQuillState();
}

class RteQuillState extends State<RteQuill> {
  String htmlString = ' this is the initial value';
  final HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return HtmlEditor(
        controller: controller
          ..setInitialText(htmlString)
          ..callbacks = Callbacks(onChangeContent: (value) {
            htmlString = value!;
          })
          ..toolbarOptions.toolbarPosition = ToolbarPosition.belowEditor);
  }
}
