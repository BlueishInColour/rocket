import 'package:flutter/material.dart';
import '../theme/theme.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => CommentScreenState();
}

class CommentScreenState extends State<CommentScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Widget commentPod(context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: const Column(
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 5),
                Text(
                  'bobby the great',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              'If the [style] argument is null, the text will use the style from the closest enclosing [DefaultTextStyle]The [data] parameter must not be null.',
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 20,
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {},
            child: const Text(
              'comment',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 13,
                color: Colors.black54,
              ),
            ))
      ]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: lPalette.primary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 10,
                minLines: 1,
                controller: controller,
                decoration: const InputDecoration(
                    hintText: 'write comment .....',
                    hintStyle: TextStyle(
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green))),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return commentPod(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
