import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rocket/utils/comment_screen.dart';
import './write_comment.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../utils/utils_functions.dart';
import 'package:http/http.dart' as http;
import 'package:line_icons/line_icon.dart';
import '../services/url.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key, this.count = '0', this.id = ''});
  final String id;
  final String count;
  @override
  State<LikeButton> createState() => LikeButtonState();
}

class LikeButtonState extends State<LikeButton> {
  bool onClicked = false;
  String gottenCount = '0';

  onPressed() async {
    var res = await http.post(Url().shortsLikePost(widget.id),
        body: onClicked ? 'no' : 'yes');
    if (res.statusCode == 200) {
      showSnackBar(context, LineIcon.thumbsUp(),
          onClicked ? 'you just liked this short' : 'is the short that bad?');
      setState(() {
        onClicked = !onClicked;
        gottenCount = res.body;
      });
    } else {
      showSnackBar(
          context,
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          'no internet connection');
    }
  }

  Future getShortCount() async {
    var res = await http.get(Url().shortsLikePost(widget.id));
    setState(() {
      gottenCount = res.body;
    });
  }

  @override
  initState() {
    super.initState();
    getShortCount();
  }

  @override
  Widget build(BuildContext context) {
    return Badge(
        backgroundColor: Colors.green,
        label: Text(gottenCount.isEmpty ? widget.count : gottenCount),
        alignment: Alignment.topCenter,
        child: IconButton(
            iconSize: 17,
            onPressed: onPressed,
            // color: onClicked ? Colors.green : null,
            icon: onClicked
                ? Icon(
                    Icons.thumb_up_sharp,
                    color: Colors.green,
                  )
                : LineIcon.thumbsUp()));
  }
}
