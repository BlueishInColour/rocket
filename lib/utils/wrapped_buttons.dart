import 'package:flutter/material.dart';
import 'package:rocket/utils/comment_screen.dart';
import './write_comment.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../utils/utils_functions.dart';
import 'package:http/http.dart' as http;
import 'package:line_icons/line_icon.dart';

class WrappedButton extends StatefulWidget {
  const WrappedButton({
    super.key,
    this.leadingIcon = const Icon(Icons.abc),
    this.child = const SizedBox(),
    this.isChild = false,
    this.shouldShowSnackBar = true,
    // this.trailingIcon = const Icon(Icons.abc),
    this.text = '',
    this.snackBarIcon = const Icon(Icons.abc),
    this.badgeColor = Colors.green,
    this.trailingText = '',
    this.showSheet = false,
    this.bottomSheetWidget = const SizedBox(),
    required this.requestUri,
    this.onClickedSnackBarText = '',
    this.unClickedSnackBarText = '',
    this.page = const WriteCommentScreen(),
  });

  final Icon leadingIcon;
  // final bool isTrailing;
  // final Icon trailingIcon;
  final bool isChild;
  final bool shouldShowSnackBar;
  final Icon snackBarIcon;
  final String onClickedSnackBarText;
  final String unClickedSnackBarText;
  final Uri requestUri;

  final Widget child;
  final bool showSheet;
  final String text;
  final Widget page;
  final String trailingText;
  final Widget bottomSheetWidget;
  final Color badgeColor;

  @override
  State<WrappedButton> createState() => WrappedButtonState();
}

class WrappedButtonState extends State<WrappedButton> {
  bool onClicked = false;
  void changeColor() {
    setState(() {
      onClicked = !onClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    onPressed() async {
      var res = await http.post(widget.requestUri);
      if (res.statusCode == 200) {
        changeColor();
        widget.shouldShowSnackBar
            ? showSnackBar(
                context,
                widget.snackBarIcon,
                onClicked
                    ? widget.onClickedSnackBarText
                    : widget.unClickedSnackBarText)
            : null;
      } else {
        widget.shouldShowSnackBar
            ? showSnackBar(
                context,
                Icon(
                  Icons.error,
                  color: Colors.red,
                ),
                'no internet connection')
            : null;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
              color: onClicked ? Colors.green : Colors.transparent,
              borderRadius: BorderRadius.circular(15)),
          child: Badge(
              backgroundColor: widget.badgeColor,
              label: Text(widget.text),
              child: Row(
                children: [
                  IconButton(
                      iconSize: 17,
                      onPressed: onPressed,
                      icon: widget.leadingIcon),
                  const SizedBox(width: 5),
                  Text(widget.trailingText, style: TextStyle(fontSize: 12))
                ],
              )),
        ),
      ),
    );
  }
}

class CommentButton extends StatefulWidget {
  const CommentButton({super.key, this.commentCount = '23'});
  final String commentCount;
  @override
  State<CommentButton> createState() => CommentButtonState();
}

class CommentButtonState extends State<CommentButton> {
  bool onClicked = false;
  void changeColor() {
    setState(() {
      onClicked = !onClicked;
    });
  }

  onPressed() {
    showModalBottomSheet(
        context: context, builder: (context) => const CommentScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15)),
          child: Badge(
              backgroundColor: Colors.green,
              label: Text(widget.commentCount),
              child: Row(
                children: [
                  IconButton(
                      iconSize: 17,
                      onPressed: onPressed,
                      icon: const LineIcon.commentAlt()),
                ],
              )),
        ),
      ),
    );
  }
}
