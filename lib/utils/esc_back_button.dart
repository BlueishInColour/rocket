import 'package:flutter/material.dart';

class EscBackButton extends StatelessWidget {
  const EscBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_new_outlined,
            color: Colors.black54, size: 17));
  }
}
