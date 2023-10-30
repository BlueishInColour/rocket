import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:rocket/models/article.dart';
import 'package:rocket/screens/starshit_store/init_starshit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rocket/screens/escape_blog/escape_horizontal_scrollview.dart';
import '../../theme/theme.dart';
import '../shorts/init_shorts.dart';
import 'escape_vertical_scrollview.dart';
// import '../../utils/toggle_theme_button.dart';
// import '../../utils/escape_icon.dart';
// import './scroll.dart';
import '../../test/test_api.dart';
import '../../utils/floating_button.dart';
import '../../utils/create_post.dart';
import '../../utils/quill.dart';
import '../../utils/wrapped_buttons.dart';
import '../../utils/add_category.dart';

class EscapeScreen extends StatefulWidget {
  const EscapeScreen({super.key});

  @override
  State<EscapeScreen> createState() => EscapeScreenState();
}

class EscapeScreenState extends State<EscapeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  String nowscreenName = 'all';
  List<String> listTabName = [
    'all',
    'music',
    'sport',
    'news',
    'anime',
    'fashion',
    'crime',
    'stories',
    'wildlife',
    'events',
    'location',
  ];

  @override
  initState() {
    super.initState();
    controller = TabController(length: listTabName.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey[100],
            title: Row(
              children: [
                Expanded(
                  child: TabBar(
                      isScrollable: true,
                      indicatorColor: lPalette.primary,
                      labelColor: Colors.green,
                      indicatorSize: TabBarIndicatorSize.values.first,
                      unselectedLabelColor: Colors.black54,
                      dividerColor: lPalette.primary,
                      labelStyle: GoogleFonts.pacifico(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      // dividerColor: Colors.green,
                      // automaticIndicatorColorAdjustment: false,
                      controller: controller,
                      onTap: (index) {},
                      tabs: listTabName.map((e) => Tab(text: e)).toList()),
                ),
                const AddCategory()
              ],
            )),
        body: TabBarView(
            controller: controller,
            children: listTabName
                .map((e) => EscapeVerticalScrollView(
                      category: e,
                    ))
                .toList()),
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
              icon: const Icon(Icons.add)),
          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Quill(
                      preview: true,
                      article: Article(
                          commentCount: '23',
                          likesCount: '2',
                          viewsCount: '13',
                          content: '<p>this is the content of the page </p>',
                          creator: 'oluwapelumi',
                          pictureUrl: '',
                          title:
                              'mesmerizing yourself in the full climax of stupidity'));
                }));
              },
              child: Text('article'))
        ]));
  }
}

class FakeScreen extends StatefulWidget {
  const FakeScreen({super.key, this.displayText = ''});
  final String displayText;
  @override
  State<FakeScreen> createState() => FakeScreenState();
}

class FakeScreenState extends State<FakeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(widget.displayText)));
  }
}
