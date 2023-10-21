import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rocket/screens/escape_blog/escape_horizontal_scrollview.dart';
import 'escape_vertical_scrollview.dart';
// import '../../utils/toggle_theme_button.dart';
// import '../../utils/escape_icon.dart';
// import './scroll.dart';
import '../../test/test_api.dart';
import '../../utils/floating_button.dart';
import '../../utils/create_post.dart';

class EscapeScreen extends StatefulWidget {
  const EscapeScreen({super.key});

  @override
  State<EscapeScreen> createState() => EscapeScreenState();
}

class EscapeScreenState extends State<EscapeScreen> {
  @override
  Widget build(BuildContext context) {
    // var appbar = AppBar(
    // backgroundColor: Colors.white54,
    // title:  const EscapeIcon(),
    // actions: const [ToogleThemeButton()],
    // );

    return Scaffold(
        // appBar: appbar,
        body: const EscapeVerticalScrollView(),
        floatingActionButton: FloatingButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, _, __) =>
                          const CreatePostScreen()));
            },
            icon: const LineIcon.alternateFeather(size: 32)),
        bottomSheet: Row(children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, _, __) => const Fastapi()));
              },
              icon: const Icon(Icons.add))
        ]));
  }
}
