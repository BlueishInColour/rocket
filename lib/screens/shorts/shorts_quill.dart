import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import '../../theme/theme.dart';

class ShortsQuill extends StatefulWidget {
  const ShortsQuill({super.key});

  @override
  State<ShortsQuill> createState() => ShortsQuillState();
}

class ShortsQuillState extends State<ShortsQuill> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      CircleAvatar(
          backgroundColor: Colors.green,
          child: IconButton(onPressed: () {}, icon: const LineIcon.camera())),
      const SizedBox(width: 10),
      Expanded(
          child: TextField(
        controller: textController,
        minLines: 1,
        maxLines: 4,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: 'write something short ....',
            hintStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Color.fromARGB(57, 158, 158, 158), width: 7),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: lPalette.text, width: 2),
                borderRadius: BorderRadius.circular(10))),
      )),
      const SizedBox(width: 10),
      IconButton(
          onPressed: () {}, icon: const Icon(Icons.send, color: Colors.green))
    ]);
  }
}
