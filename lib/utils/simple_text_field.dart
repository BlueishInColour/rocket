import 'package:flutter/material.dart';
import '../theme/theme.dart';

class SimpleTextField extends StatelessWidget {
  const SimpleTextField({super.key, required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Expanded(child: TextField(controller: controller)),
    );
  }
}
