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
          const LineIcon.rocket(
            color: Colors.black45,
          ),
          const SizedBox(width: 15),
          Text(
            'escape',
            style: GoogleFonts.amethysta(
                fontWeight: FontWeight.bold, color: Colors.black45),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const ToogleThemeButton()
          // const CreatePostButton()
        ],
      ),
    );
  }
}
