import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import '../models/article.dart';
import '../services/url.dart';
import '../theme/theme.dart';
import '../screens/shorts/shorts_quill.dart';

class GreatQuill extends StatefulWidget {
  GreatQuill({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GreatQuillState createState() => _GreatQuillState();
}

class _GreatQuillState extends State<GreatQuill> {
  String postTitle = '';
  final HtmlEditorController controller = HtmlEditorController();
  Article article = Article();

  Widget title(context, {String text = 'title here ...'}) {
    var style = GoogleFonts.montserrat(
        fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold);
    return SizedBox(
        height: 150,
        child: TextField(
          maxLines: 20,
          minLines: 1,
          onChanged: (v) {
            setState(() {
              article.title = v;
            });
          },
          style: style,
          decoration: InputDecoration(hintText: text, hintStyle: style),
        ));
  }

  Widget image(context) {
    return CachedNetworkImage(
        imageUrl: article.pictureUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return Container(
            height: 200,
            color: lPalette.primary,
            child: const Center(
                child: CircularProgressIndicator(color: Colors.black45)),
          );
        },
        errorWidget: (_, __, ___) => Container(
            height: 200,
            color: lPalette.primary,
            child: const Center(
              child: Text('unable to load image'),
            )));
  }

  uploadArticle() async {
    var res = await http.post(Url().blogUploadPost());
    if (res.statusCode == 200) {
      print('upload successfull');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!kIsWeb) {
          controller.clearFocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.red)),
            toolbarHeight: 55,
            backgroundColor: Colors.grey[200],
            automaticallyImplyLeading: true,
            leadingWidth: 25,
            title: const ShortsQuill()),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint('uploading');
              uploadArticle();
            },
            child: Icon(Icons.file_upload_outlined, color: Colors.white54)),
        body: Center(
          child: SizedBox(
            width: 500,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  HtmlEditor(
                    controller: controller,
                    htmlEditorOptions: HtmlEditorOptions(
                      hint: 'Your text here...',
                      shouldEnsureVisible: true,
                      //initialText: "<p>text content initial, if any</p>",
                    ),
                    htmlToolbarOptions: HtmlToolbarOptions(
                      customToolbarButtons: <Widget>[
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.cancel_rounded, color: Colors.red))
                      ],
                      toolbarPosition: ToolbarPosition.belowEditor, //by default
                      toolbarType: ToolbarType.nativeScrollable, //by default
                      onButtonPressed: (ButtonType type, bool? status,
                          Function? updateStatus) {
                        print(
                            "button '${describeEnum(type)}' pressed, the current selected status is $status");
                        return true;
                      },
                      onDropdownChanged: (DropdownType type, dynamic changed,
                          Function(dynamic)? updateSelectedItem) {
                        print(
                            "dropdown '${describeEnum(type)}' changed to $changed");
                        return true;
                      },
                      mediaLinkInsertInterceptor:
                          (String url, InsertFileType type) {
                        print(url);
                        return true;
                      },
                      mediaUploadInterceptor:
                          (PlatformFile file, InsertFileType type) async {
                        print(file.name); //filename
                        print(file.size); //size in bytes
                        print(file.extension); //file extension (eg jpeg or mp4)
                        return true;
                      },
                    ),
                    otherOptions: OtherOptions(height: 550),
                    callbacks: Callbacks(
                        onBeforeCommand: (String? currentHtml) {
                      print('html before change is $currentHtml');
                    }, onChangeContent: (String? changed) {
                      print('content changed to $changed');
                      setState(() {
                        article.content = changed!;
                      });
                    }, onChangeCodeview: (String? changed) {
                      print('code changed to $changed');
                    }, onChangeSelection: (EditorSettings settings) {
                      print('parent element is ${settings.parentElement}');
                      print('font name is ${settings.fontName}');
                    }, onDialogShown: () {
                      print('dialog shown');
                    }, onEnter: () {
                      print('enter/return pressed');
                    }, onFocus: () {
                      print('editor focused');
                    }, onBlur: () {
                      print('editor unfocused');
                    }, onBlurCodeview: () {
                      print('codeview either focused or unfocused');
                    }, onInit: () {
                      print('init');
                    },
                        //this is commented because it overrides the default Summernote handlers
                        /*onImageLinkInsert: (String? url) {
                        print(url ?? "unknown url");
                      },
                      onImageUpload: (FileUpload file) async {
                        print(file.name);
                        print(file.size);
                        print(file.type);
                        print(file.base64);
                      },*/
                        onImageUploadError: (FileUpload? file,
                            String? base64Str, UploadError error) {
                      print(describeEnum(error));
                      print(base64Str ?? '');
                      if (file != null) {
                        print(file.name);
                        print(file.size);
                        print(file.type);
                      }
                    }, onKeyDown: (int? keyCode) {
                      print('$keyCode key downed');
                      print(
                          'current character count: ${controller.characterCount}');
                    }, onKeyUp: (int? keyCode) {
                      print('$keyCode key released');
                    }, onMouseDown: () {
                      print('mouse downed');
                    }, onMouseUp: () {
                      print('mouse released');
                    }, onNavigationRequestMobile: (String url) {
                      print(url);
                      return NavigationActionPolicy.ALLOW;
                    }, onPaste: () {
                      print('pasted into editor');
                    }, onScroll: () {
                      print('editor scrolled');
                    }),
                    plugins: [
                      SummernoteAtMention(
                          getSuggestionsMobile: (String value) {
                            var mentions = <String>['test1', 'test2', 'test3'];
                            return mentions
                                .where((element) => element.contains(value))
                                .toList();
                          },
                          mentionsWeb: ['test1', 'test2', 'test3'],
                          onSelect: (String value) {
                            print(value);
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
