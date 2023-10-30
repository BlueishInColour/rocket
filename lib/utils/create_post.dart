import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:line_icons/line_icon.dart';
// import 'package:rocket/theme/theme.dart';
// import '../utils/wrapped_buttons.dart';
import './quill.dart';
import './esc_back_button.dart';
import './simple_text_field.dart';
import '../models/article.dart';

class CreatePostButton extends StatefulWidget {
  const CreatePostButton({super.key});

  @override
  State<CreatePostButton> createState() => CreatePostButtonState();
}

class CreatePostButtonState extends State<CreatePostButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('clicked');
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context, _, __) {
          return CreatePostScreen();
        }));
      },
      child: Container(
          child: Row(
        children: [
          Icon(
            Icons.add,
            size: 16,
            color: Colors.black54,
          ),
          Text(
            'write',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          SizedBox(width: 25)
        ],
      )),
    );
  }
}

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => CreatePostScreenState();
}

class CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
        leading: EscBackButton(),
        title: SimpleTextField(
          controller: _controller,
        ));
    return Scaffold(
        body: Quill(
      article: Article(
        commentCount: '256k',
        content: '<h1>this is totally a sample</h1>',
        creator: 'babyboo',
        creatorChannel: 'babieworld',
        likesCount: '0',
        pictureUrl: 'http://ohe;oiwhje;oik.com',
        title: 'what is the topic',
        viewsCount: '100M',
      ),
    ));
  }
}
