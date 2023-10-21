import 'package:flutter/material.dart';
import '../theme/theme.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Expanded(
          child: TextField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: 'title here',
            hintStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lPalette.primary),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lPalette.primary),
                borderRadius: BorderRadius.circular(10))),
      )),
    );
  }
}
