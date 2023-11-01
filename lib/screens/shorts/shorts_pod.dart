import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:rocket/theme/theme.dart';

import 'package:rocket/models/article.dart';
// import '../../utils/comment_screen.dart';
import '../../services/url.dart';
import '../../utils/plain_buttons.dart';
import '../../utils/utils_functions.dart';
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
        CircleAvatar(
          backgroundColor: lPalette.primary,
          radius: 10,
        ),
        const SizedBox(width: 5),
        Text(
          article.creator,
          style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: lPalette.darkText,
              fontWeight: FontWeight.w800),
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
                  child: Center(
                    child: Text(article.pictureUrl),
                  ))),
        ),
      );
    }

    Widget textBody(context) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Text(article.title,
            maxLines: 3,
            style: GoogleFonts.zeyada(
              // overflow: TextOverflow.ellipsis,
              color: lPalette.darkText,
              fontSize: widget.article.pictureUrl.isNotEmpty ? 20 : 25,
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
              PlainButton(
                leadingIcon: const LineIcon.thumbsUpAlt(),
                text: article.likesCount,
                snackBarIcon: LineIcon.thumbsUpAlt(
                  color: Colors.white60,
                ),
                onClickedSnackBarText: 'post liked',
                unClickedSnackBarText: 'you disliked this post',
                requestUri: Url().shortsLikePost(article.id),
              ),
              const SizedBox(height: 5),
              const PlainCommentButton(),
            ]),
      );
    }

    return Container(
      height: widget.podHeight,
      width: widget.podWidth,
      color: Colors.white54,
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
      // margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: SizedBox()),
                  bottom(context),
                ],
              )),
          Expanded(
            child: Container(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  creatorHeader(context),
                  const SizedBox(height: 4),
                  article.pictureUrl.isEmpty ? SizedBox() : image(context),
                  textBody(context),
                  const SizedBox(height: 4),
                  styledivider
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
