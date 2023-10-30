import 'package:flutter/material.dart';
import 'package:styled_divider/styled_divider.dart';
// import '../../';

escShowModelBottomSheet(context, {Widget screen = const SizedBox()}) {
  showModalBottomSheet(context: context, builder: (context) => screen);
}

//
showSnackBar(context, Icon icon, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      showCloseIcon: true,
      closeIconColor: Colors.white60,
      duration: const Duration(seconds: 1),
      content: Row(
        children: [
          icon,
          const SizedBox(width: 20),
          Text(
            text,
            maxLines: 4,
            style: const TextStyle(
                color: Colors.white60, overflow: TextOverflow.ellipsis),
          ),
        ],
      )));
}

var styledivider = const StyledDivider(
  color: Colors.green,
  height: 20,
  thickness: 2,
  lineStyle: DividerLineStyle.dashdotted,
  indent: 20,
  endIndent: 20,
);
