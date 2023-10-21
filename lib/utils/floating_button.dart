import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  FloatingButton({super.key, required this.onPressed, required this.icon});
  void Function()? onPressed;
  final Icon icon;
  @override
  State<FloatingButton> createState() => FloatingButtonState();
}

class FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white54,
      radius: 40,
      child: FloatingActionButton(
        onPressed: widget.onPressed,
        child: widget.icon,
      ),
    );
  }
}
