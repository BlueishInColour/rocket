import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
// import 'create_post.dart';
import '../theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EscapeIcon extends StatefulWidget {
  const EscapeIcon({super.key, this.showTitle = true});
  final bool showTitle;
  @override
  State<EscapeIcon> createState() => EscapeIconState();
}

class EscapeIconState extends State<EscapeIcon> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          widget.showTitle
              ? Text(
                  'Turtle',
                  style: GoogleFonts.pacifico(
                      fontSize: 19,
                      fontWeight: FontWeight.w900,
                      color: lPalette.text),
                )
              : SizedBox(),
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
