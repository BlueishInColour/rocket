import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_quill/flutter_quill.dart';
import 'package:quill_html_editor/quill_html_editor.dart';
import '../services/url.dart';
import '../theme/theme.dart';
import '../models/article.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:line_icons/line_icon.dart';
import '../../utils/plain_buttons.dart';
import './esc_back_button.dart';
import 'package:http/http.dart' as http;
import 'escape_icon.dart';

class Quill extends StatefulWidget {
  const Quill({super.key, this.preview = false, required this.article});

  final bool preview;
  final Article article;

  @override
  State<Quill> createState() => QuillState();
}

class QuillState extends State<Quill> {
  // QuillController controller = QuillController.basic();
  final QuillEditorController quillController = QuillEditorController();
  final TextEditingController controller = TextEditingController();
  TextEditingController titleTextController = TextEditingController();
  String picturePath = '';
  //
  pickPicture() async {
    ImagePicker picker = ImagePicker();

    XFile? selected = await picker.pickImage(source: ImageSource.gallery);
    print(selected!.path);
    setState(() {
      picturePath = selected!.path;
    });
  }

  final dio = Dio();

  @override
  initState() {
    super.initState();
    setState(() {
      titleTextController.text = 'what`s the topic?';
      widget.article.title = titleTextController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    Article article = widget.article;
    bool preview = widget.preview;

    TextStyle textStyle = const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 14);

    TextStyle clear = const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.red, fontSize: 14);

    toolBar(context) {
      return ToolBar(
        toolBarColor: lPalette.primary,
        activeIconColor: Colors.green,
        padding: const EdgeInsets.all(8),
        iconSize: 20,
        controller: quillController,
        customButtons: [
          InkWell(onTap: () {}, child: const Icon(Icons.favorite)),
          InkWell(onTap: () {}, child: const Icon(Icons.add_circle)),
        ],
      );
    }

    Widget buttonRow(context) {
      return Container(
        color: lPalette.primary,
        child: Row(children: [
          //view
          TextButton(
              onPressed: () {
                setState(() {
                  preview = !preview;
                });
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
          TextButton(onPressed: () {}, child: Text('draft', style: textStyle)),
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
      );
    }

    var appbar = AppBar(
      title: EscapeIcon(),
      leading: const EscBackButton(),
      bottom: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          toolbarHeight: 150,
          title: SizedBox(
            child: Column(
              children: [
                preview ? const SizedBox() : toolBar(context),
                buttonRow(context),
              ],
            ),
          )),
    );

    //
    Widget inputHeader(context) {
      return Container(
        color: lPalette.primary,
        child: Row(children: [
          const SizedBox(width: 10),
          Expanded(
              child: TextField(
                  controller: titleTextController,
                  minLines: 1,
                  maxLines: 4,
                  onChanged: (value) {
                    setState(() {
                      titleTextController.text = value;
                    });
                  },
                  decoration:
                      InputDecoration(hintText: titleTextController.text))),
          const SizedBox(width: 10),
          Badge(
            isLabelVisible: picturePath.isNotEmpty ? true : false,
            // label: Text('1'),
            child: CircleAvatar(
              radius: 22,
              backgroundColor:
                  picturePath.isNotEmpty ? Colors.green : lPalette.primary,
              child: CircleAvatar(
                  backgroundColor:
                      picturePath.isNotEmpty ? lPalette.primary : Colors.green,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          picturePath = 'fsdre';
                        });
                        pickPicture();
                      },
                      icon: LineIcon.camera(
                        color: picturePath.isNotEmpty ? Colors.green : null,
                      ))),
            ),
          ),
        ]),
      );
    }

    //
    Widget quill(context) {
      return Container(
        height: 900,
        width: 450,
        child: Center(
          child: QuillHtmlEditor(
            text: "<h1>content of the article goes here</h1>",
            hintText:
                'write beautiful stories, escape from your shell inn rocket style',
            controller: quillController,
            isEnabled: preview ? false : true,
            minHeight: 700,
            // textStyle: _editorTextStyle,
            // hintTextStyle: _hintTextStyle,
            hintTextAlign: TextAlign.start,
            padding: const EdgeInsets.only(left: 10, top: 5),
            hintTextPadding: EdgeInsets.zero,
            // backgroundColor: _backgroundColor,
            onFocusChanged: (hasFocus) => debugPrint('has focus $hasFocus'),
            onTextChanged: (text) async {
              debugPrint('widget text change $text');

              String htmlText = await quillController.getText();
              setState(() {
                article.content = htmlText;
              });
            },
            onEditorCreated: () => debugPrint('Editor has been loaded'),
            onEditingComplete: (s) async {
              debugPrint('Editing completed $s');
              String htmlText = await quillController.getText();
              setState(() {
                article.content = htmlText;
              });
            },
            onEditorResized: (height) => debugPrint('Editor resized $height'),
            onSelectionChanged: (sel) =>
                debugPrint('${sel.index},${sel.length}'),
            loadingBuilder: (context) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 0.4),
              );
            },
          ),
        ),
      );
    }

    Widget title(context) {
      return Text(titleTextController.text,
          maxLines: 4,
          style: GoogleFonts.montserrat(
            fontSize: 50,
            // overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ));
    }

    Widget creatorHeader(context) {
      return (Row(children: [
        CircleAvatar(
          backgroundColor: lPalette.primary,
          radius: 10,
        ),
        const SizedBox(width: 5),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: article.creator,
            style: GoogleFonts.montserrat(
                // overflow: TextOverflow.el`lipsis,
                color: Colors.green,
                fontWeight: FontWeight.w800),
          ),
          TextSpan(
            text: '  in  ',
            style: GoogleFonts.montserrat(
                // overflow: TextOverflow.ellipsis,
                color: lPalette.text,
                fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: article.creatorChannel,
            style: GoogleFonts.montserrat(
                // overflow: TextOverflow.ellipsis,
                color: Colors.green,
                fontWeight: FontWeight.w800),
          )
        ])),
      ]));
    }

    Widget image(context, {String url = 'suiodoi'}) {
      return Expanded(
        child: SizedBox(
          width: 450,
          // height: 250,
          child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  height: 250,
                  color: lPalette.primary,
                  child: const Center(
                      child: CircularProgressIndicator(color: Colors.black45)),
                );
              },
              errorWidget: (_, __, ___) => Container(
                  height: 250,
                  color: lPalette.primary,
                  child: const Center(
                    child: Text('unable to load image'),
                  ))),
        ),
      );
    }

    Widget bottom(context) {
      return (Container(
        height: 40,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PlainButton(
                leadingIcon: const LineIcon.thumbsUpAlt(),
                text: article.likesCount,
                snackBarIcon: LineIcon.thumbsUpAlt(
                  color: Colors.white60,
                ),
                onClickedSnackBarText: 'post liked',
                unClickedSnackBarText: 'you disliked this post',
                requestUri: Url().blogLikePost(article.id),
              ),
              Badge(
                  alignment: Alignment.topCenter,
                  backgroundColor: Colors.green,
                  label: Text(article.viewsCount),
                  child: LineIcon.eyeAlt()),
              const PlainCommentButton(),
            ]),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: EscapeIcon(),
        leading: const EscBackButton(),
        bottom: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            toolbarHeight: 170,
            title: Expanded(
              child: Column(
                children: [
                  preview ? const SizedBox() : toolBar(context),
                  buttonRow(context),
                ],
              ),
            )),
      ),
      body: Center(
          child: SizedBox(
        child: ListView(
          children: [
            // preview ? const SizedBox() : toolBar(context),
            preview ? const SizedBox() : inputHeader(context),
            // buttonRow(context),
            const SizedBox(height: 20),
            title(context),
            const SizedBox(height: 20),
            creatorHeader(context),
            const SizedBox(height: 20),
            image(context),
            const SizedBox(height: 20),
            Expanded(child: quill(context))
          ],
        ),
      )),
    );
  }
}

// class ArticleView extends StatefulWidget {
//   const ArticleView(
//       {super.key,
//       required this.article,
//       this.articleHtmlText = '<h1>header</h1>'});

//   final Article article;
//   final String articleHtmlText;

//   @override
//   State<ArticleView> createState() => ArticleViewState();
// }

// class ArticleViewState extends State<ArticleView> {
//   QuillEditorController controller = QuillEditorController();

//   @override
//   Widget build(BuildContext context) {
//     Widget creatorHeader(context) {
//       return (Row(children: [
//         CircleAvatar(
//           backgroundColor: lPalette.primary,
//           radius: 10,
//         ),
//         const SizedBox(width: 5),
//         RichText(
//             text: TextSpan(children: [
//           TextSpan(
//             text: article.creator,
//             style: GoogleFonts.montserrat(
//                 // overflow: TextOverflow.el`lipsis,
//                 color: Colors.green,
//                 fontWeight: FontWeight.w800),
//           ),
//           TextSpan(
//             text: '  in  ',
//             style: GoogleFonts.montserrat(
//                 // overflow: TextOverflow.ellipsis,
//                 color: lPalette.text,
//                 fontWeight: FontWeight.w400),
//           ),
//           TextSpan(
//             text: article.creatorChannel,
//             style: GoogleFonts.montserrat(
//                 // overflow: TextOverflow.ellipsis,
//                 color: Colors.green,
//                 fontWeight: FontWeight.w800),
//           )
//         ])),
//       ]));
//     }

//     Widget image(context, {String url = 'suiodoi'}) {
//       return Expanded(
//         child: SizedBox(
//           width: 450,
//           // height: 250,
//           child: CachedNetworkImage(
//               imageUrl: url,
//               fit: BoxFit.cover,
//               placeholder: (context, url) {
//                 return Container(
//                   height: 250,
//                   color: lPalette.primary,
//                   child: const Center(
//                       child: CircularProgressIndicator(color: Colors.black45)),
//                 );
//               },
//               errorWidget: (_, __, ___) => Container(
//                   height: 250,
//                   color: lPalette.primary,
//                   child: const Center(
//                     child: Text('unable to load image'),
//                   ))),
//         ),
//       );
//     }

//     Widget bottom(context) {
//       return (Container(
//         height: 40,
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               PlainButton(
//                 leadingIcon: const LineIcon.thumbsUpAlt(),
//                 text: article.likesCount,
//                 snackBarIcon: LineIcon.thumbsUpAlt(
//                   color: Colors.white60,
//                 ),
//                 onClickedSnackBarText: 'post liked',
//                 unClickedSnackBarText: 'you disliked this post',
//                 requestUrl: 'http://localhost:8000/blog/like/${article.id}',
//               ),
//               Badge(
//                   alignment: Alignment.topCenter,
//                   backgroundColor: Colors.green,
//                   label: Text(article.viewsCount),
//                   child: LineIcon.eyeAlt()),
//               const PlainCommentButton(),
//             ]),
//       ));
//     }

//     return Scaffold(
//       appBar: AppBar(
//           leading: const EscBackButton(),
//           automaticallyImplyLeading: true,
//           title: const EscapeIcon()),
//       body: Center(
//         child: Container(
//           margin: EdgeInsets.all(5),
//           width: 450,
//           child: Expanded(
//             child: ListView(
//               children: [
//                 Text(article.title,
//                     maxLines: 4,
//                     style: GoogleFonts.montserrat(
//                       fontSize: 50,
//                       // overflow: TextOverflow.ellipsis,
//                       fontWeight: FontWeight.w800,
//                       color: Colors.black87,
//                     )),
//                 SizedBox(height: 20),
//                 creatorHeader(context),
//                 SizedBox(height: 20),
//                 image(context),
//                 SizedBox(height: 20),
//                 SizedBox(
//                   width: 450,
//                   height: 700,
//                   child: QuillHtmlEditor(
//                       text: article.content,
//                       textStyle: GoogleFonts.montserrat(
//                           fontSize: 20, color: lPalette.text),
//                       hintText: article.content,
//                       controller: controller,
//                       autoFocus: false,
//                       isEnabled: false,
//                       minHeight: 300),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomSheet: bottom(context),
//     );
//   }
// }
