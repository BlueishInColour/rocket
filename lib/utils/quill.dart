import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import '../theme/theme.dart';
import '../models/article.dart';
import 'package:dio/dio.dart';

import './esc_back_button.dart';
import 'escape_icon.dart';

class Quill extends StatefulWidget {
  const Quill({super.key});

  @override
  State<Quill> createState() => QuillState();
}

class QuillState extends State<Quill> {
  // QuillController controller = QuillController.basic();
  final QuillEditorController quillController = QuillEditorController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController controller = TextEditingController();
  final dio = Dio();
  Article article = Article(
    commentCount: '',
    content: '<h1>this is totally a sample</h1>',
    creator: '',
    likesCount: '',
    pictureUrl: '',
    title: '',
    viewsCount: '',
  );

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
        leading: const EscBackButton(),
        title: SizedBox(
          child: Expanded(
              child: TextField(
            controller: titleController,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'title here',
                hintStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: lPalette.primary),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: lPalette.primary),
                    borderRadius: BorderRadius.circular(10))),
          )),
        ));

    TextStyle textStyle = const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 14);

    TextStyle clear = const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14);

    return Scaffold(
        appBar: appbar,
        body: Center(
            child: SizedBox(
          height: 900,
          width: 450,
          child: Column(
            children: [
              Container(
                color: lPalette.primary,
                child: Row(children: [
                  //view
                  TextButton(
                      onPressed: () {
                        debugPrint('view clicked');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ArticleView(
                              articleHtmlText: article.content,
                              article: article);
                        }));
                      },
                      child: Text('preview', style: textStyle)),

                  //clear
                  TextButton(
                      onPressed: () {
                        quillController.clear();
                      },
                      child: Text('clear', style: clear)),

                  //save text
                  TextButton(
                      onPressed: () async {
                        String htmlText = await quillController.getText();
                        setState(() {
                          article.content = htmlText;
                        });
                        if (kDebugMode) {
                          print(article.content);
                        }
                      },
                      child: Text('save', style: textStyle)),
                  TextButton(
                      onPressed: () {}, child: Text('draft', style: textStyle)),
                  const Expanded(child: SizedBox()),

                  //upload Article
                  TextButton(
                      onPressed: () async {
                        String htmlText = await quillController.getText();
                        setState(() {
                          article.content = htmlText;
                        });
                        print(article.toJson());
                        // debugPrint('clicked here there');
                        var res = await dio.post('http://127.0.0.1:8000/write',
                            options: Options(contentType: 'application/json'),
                            data: article.toJson());

                        // print(res);
                      },
                      child: Text('upload', style: textStyle))
                ]),
              ),
              ToolBar(
                toolBarColor: lPalette.primary,
                activeIconColor: Colors.green,
                padding: const EdgeInsets.all(8),
                iconSize: 20,
                controller: quillController,
                customButtons: [
                  InkWell(onTap: () {}, child: const Icon(Icons.favorite)),
                  InkWell(onTap: () {}, child: const Icon(Icons.add_circle)),
                ],
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: QuillHtmlEditor(
                      text: "<h1>escape title here</h1>",
                      hintText:
                          'write beautiful stories, escape from your shell inn rocket style',
                      controller: quillController,
                      isEnabled: true,
                      minHeight: 700,
                      // textStyle: _editorTextStyle,
                      // hintTextStyle: _hintTextStyle,
                      hintTextAlign: TextAlign.start,
                      padding: const EdgeInsets.only(left: 10, top: 5),
                      hintTextPadding: EdgeInsets.zero,
                      // backgroundColor: _backgroundColor,
                      onFocusChanged: (hasFocus) =>
                          debugPrint('has focus $hasFocus'),
                      onTextChanged: (text) async {
                        debugPrint('widget text change $text');

                        String htmlText = await quillController.getText();
                        setState(() {
                          article.content = htmlText;
                        });
                      },
                      onEditorCreated: () =>
                          debugPrint('Editor has been loaded'),
                      onEditingComplete: (s) async {
                        debugPrint('Editing completed $s');
                        String htmlText = await quillController.getText();
                        setState(() {
                          article.content = htmlText;
                        });
                      },
                      onEditorResized: (height) =>
                          debugPrint('Editor resized $height'),
                      onSelectionChanged: (sel) =>
                          debugPrint('${sel.index},${sel.length}'),
                      loadingBuilder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(strokeWidth: 0.4),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}

class ArticleView extends StatefulWidget {
  const ArticleView(
      {super.key,
      required this.article,
      this.articleHtmlText = '<h1>header</h1>'});

  final Article article;
  final String articleHtmlText;

  @override
  State<ArticleView> createState() => ArticleViewState();
}

class ArticleViewState extends State<ArticleView> {
  QuillEditorController controller = QuillEditorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: const EscBackButton(),
            automaticallyImplyLeading: true,
            title: const EscapeIcon()),
        body: Center(
          child: SizedBox(
            height: 700,
            width: 450,
            child: SizedBox(
              width: 450,
              height: 700,
              child: QuillHtmlEditor(
                  text: widget.article.content,
                  hintText: widget.article.content,
                  controller: controller,
                  autoFocus: false,
                  isEnabled: false,
                  minHeight: 300),
            ),
          ),
        ));
  }
}
