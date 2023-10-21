import '../theme/theme.dart';
import 'package:flutter/material.dart';

class WriteCommentScreen extends StatefulWidget {
  const WriteCommentScreen({super.key});

  @override
  State<WriteCommentScreen> createState() => WriteCommentScreenState();
}

class WriteCommentScreenState extends State<WriteCommentScreen> {
  @override
  Widget build(BuildContext context) {
    var appbar = AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: lPalette.text,
            )),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text('comment',
                  style: TextStyle(
                      color: lPalette.text,
                      fontSize: 14,
                      fontWeight: FontWeight.w900)))
        ]);
    return Scaffold(
      appBar: appbar,
    );
  }
}

showCommentScreen() {}
