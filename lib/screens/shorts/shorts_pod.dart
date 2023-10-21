import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:line_icons/line_icon.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:rocket/theme/theme.dart';

import '../../models/article.dart';
// import '../../utils/comment_screen.dart';
import '../../utils/wrapped_buttons.dart';
// import '../../utils/write_comment.dart';
// import '../../utils/utils_functions.dart';

class ShortsPod extends StatefulWidget {
  const ShortsPod(
      {super.key,
      this.podWidth = 470,
      this.podHeight = 250,
      required this.article});

  final Article article;
  final double podWidth;
  final double podHeight;
  @override
  State<ShortsPod> createState() => ShortsPodState();
}

class ShortsPodState extends State<ShortsPod> {
  @override
  Widget build(BuildContext context) {
    final article = widget.article;
//

    Widget creatorHeader(context) {
      return (Row(children: [
        const SizedBox(width: 5),
        Text(
          article.creator,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis, fontWeight: FontWeight.w800),
        ),
      ]));
    }

    Widget image(context) {
      return Expanded(
        child: SizedBox(
          width: 400,

          // height: 250,
          child: CachedNetworkImage(
              imageUrl: article.pictureUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) {
                return Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  height: 250,
                  // color: lPalette.primary,
                  child: const Center(
                      child: CircularProgressIndicator(color: Colors.black45)),
                );
              },
              errorWidget: (_, __, ___) => Container(
                  decoration: BoxDecoration(
                      color: lPalette.primary,
                      borderRadius: BorderRadius.circular(15)),
                  height: 250,
                  child: const Center(
                    child: Text('unable to load image'),
                  ))),
        ),
      );
    }

    Widget textBody(context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Text(article.title,
            maxLines: 3,
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      );
    }

    Widget bottom(context) {
      return Container(
        height: 100,
        margin: EdgeInsets.all(5),
        child: Column(
            // mainAxisAlignment: ,
            children: [
              WrappedButton(
                leadingIcon: LineIcon.thumbsUpAlt(),
                text: article.likesCount,
                snackBarIcon: LineIcon.thumbsUpAlt(
                  color: Colors.white60,
                ),
                onClickedSnackBarText: 'post liked',
                unClickedSnackBarText: 'you disliked this post',
                requestUrl: 'http://localhost:8000/blog/like/${article.id}',
              ),
              SizedBox(height: 5),
              CommentButton(),
            ]),
      );
    }

    return Container(
      height: widget.podHeight,
      width: widget.podWidth,
      color: Colors.white54,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: lPalette.primary,
                  ),
                  bottom(context),
                ],
              )),
          Container(
            width: 400,
            child: Column(
              children: [
                creatorHeader(context),
                SizedBox(height: 4),
                image(context),
                textBody(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
