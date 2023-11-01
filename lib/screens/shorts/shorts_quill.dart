import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import '../../theme/theme.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../utils/utils_functions.dart';

class ShortsQuill extends StatefulWidget {
  const ShortsQuill({super.key});

  @override
  State<ShortsQuill> createState() => ShortsQuillState();
}

class ShortsQuillState extends State<ShortsQuill> {
  TextEditingController textController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(children: [
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
                      pickPicture();
                    },
                    icon: LineIcon.camera(
                      color: picturePath.isNotEmpty ? Colors.green : null,
                    ))),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: TextField(
          controller: textController,
          minLines: 1,
          maxLines: 10,
          decoration: InputDecoration(
              hintStyle:
                  GoogleFonts.pacifico(color: Colors.black54, fontSize: 12),
              hintText: 'write something short ......'),
        )),
        const SizedBox(width: 10),
        IconButton(
            onPressed: () async {
              var url = Uri.parse(
                  'http://localhost:8000/shorts/upload/?text=${textController.text}');
              var res = await http.post(url);
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
                  picturePath = '';
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
