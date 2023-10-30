import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
// import 'create_post.dart';
import './toggle_theme_button.dart';

class EscapeIcon extends StatefulWidget {
  const EscapeIcon({super.key});

  @override
  State<EscapeIcon> createState() => EscapeIconState();
}

class EscapeIconState extends State<EscapeIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Text(
            'Quill',
            style: GoogleFonts.pacifico(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.black87),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          // const ToogleThemeButton(),
          // const CreatePostButton()
        ],
      ),
    );
  }
}
