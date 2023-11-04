import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagekit_io/imagekit_io.dart';
import 'package:line_icons/line_icon.dart';
import '../../theme/theme.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../utils/utils_functions.dart';
import '../../models/shorts.dart';

class ShortsQuill extends StatefulWidget {
  const ShortsQuill({super.key});

  @override
  State<ShortsQuill> createState() => ShortsQuillState();
}

class ShortsQuillState extends State<ShortsQuill> {
  TextEditingController textController = TextEditingController();
  File? file;
  Shorts shorts =
      Shorts(id: '12345', creator: 'BlueishInColour', picture: '', text: '');
  Future<void> selectImage() async {
    final xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (xFile == null) return;
    setState(() {
      file = File(xFile.path);
    });
  }

  String privateKey = 'private_A9tBBPhf/8CSEYPp+CR986xpRzE=';

  pickPicture() async {
    await selectImage();
    await ImageKit.io(
      file!.readAsBytesSync(),
      fileName: 'afilename',
      //  folder: "folder_name/nested_folder", (Optional)
      privateKey: privateKey, // (Keep Confidential)
      onUploadProgress: (progressValue) {
        if (true) {
          print(progressValue);
        }
      },
    ).then((ImagekitResponse data) {
      /// Get your uploaded Image file link from [ImageKit.io]
      /// then save it anywhere you want. For Example- [Firebase, MongoDB] etc.

      print(data.url!); // (you will get all Response data from ImageKit)
      setState(() {
        shorts.picture = data.url!;
      });
      // print(data.fileId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50,
      child: Row(children: [
        Badge(
          isLabelVisible: shorts.picture.isNotEmpty ? true : false,
          // label: Text('1'),
          child: CircleAvatar(
            radius: 22,
            backgroundColor:
                shorts.picture.isNotEmpty ? Colors.green : lPalette.primary,
            child: FloatingActionButton(
                backgroundColor:
                    shorts.picture.isNotEmpty ? lPalette.primary : Colors.green,
                onPressed: () {
                  pickPicture();
                },
                child: LineIcon.camera(
                  color: shorts.picture.isNotEmpty ? Colors.green : null,
                )),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: TextField(
          onChanged: (v) {
            setState(() {
              shorts.text = v;
            });
          },
          style: GoogleFonts.pacifico(color: Colors.black87, fontSize: 17),
          controller: textController,
          minLines: 1,
          // maxLines: 2,
          decoration: InputDecoration(
              hintStyle:
                  GoogleFonts.pacifico(color: Colors.black54, fontSize: 17),
              hintText: 'write something short ......'),
        )),
        const SizedBox(width: 10),
        IconButton(
            onPressed: () async {
              debugPrint("$shorts.picture and ${textController.text}");
              var url = Uri.parse(
                'http://localhost:8080/db/shorts',
              );
              var res = await http.post(url,
                  body: json.encode(shorts.toJson()),
                  headers: {"Content-Type": "application/json"});
              if (res.statusCode == 200) {
                showSnackBar(
                    context,
                    Icon(
                      Icons.done_all_outlined,
                      color: Colors.green,
                    ),
                    'you just put out a short');
                textController.clear();
                setState(() {
                  shorts.picture = '';
                });
              } else {
                showSnackBar(context, Icon(Icons.error, color: Colors.red),
                    'no internet connection');
              }
            },
            icon: const Icon(Icons.send, color: Colors.green))
      ]),
    );
  }
}
