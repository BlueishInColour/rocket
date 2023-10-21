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

class RocketPod extends StatefulWidget {
  const RocketPod(
      {super.key,
      this.podWidth = 430,
      this.podHeight = 450,
      required this.article});

  final Article article;
  final double podWidth;
  final double podHeight;
  @override
  State<RocketPod> createState() => RocketPodState();
}

class RocketPodState extends State<RocketPod> {
  @override
  Widget build(BuildContext context) {
    final article = widget.article;
//

    Widget creatorHeader(context) {
      return (Row(children: [
        CircleAvatar(
          backgroundColor: lPalette.primary,
        ),
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
          width: 450,
          // height: 250,
          child: CachedNetworkImage(
              imageUrl: article.pictureUrl,
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

    Widget textBody(context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Text(article.title,
            maxLines: 3,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      );
    }

    Widget bottom(context) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: Row(children: [
          WrappedButton(
              snackBarIcon: const LineIcon.retweet(
                color: Colors.white60,
              ),
              onClickedSnackBarText: 're-posted to www.twix.com',
              unClickedSnackBarText: 'post removed from www.twix.com',
              leadingIcon: const LineIcon.retweet(),
              requestUrl: 'http://localhost:8000/blog/repost/${article.id}',
              text: '23',
              trailingText: 're-post  '),
          const Expanded(child: SizedBox()),
          const CommentButton(),
          WrappedButton(
            leadingIcon: const Icon(Icons.remove_red_eye_outlined),
            text: article.viewsCount,
            snackBarIcon: const Icon(
              Icons.remove_red_eye_outlined,
              color: Colors.white60,
            ),
            unClickedSnackBarText: 'post unseen',
            onClickedSnackBarText: 'post seen',
            requestUrl: 'http://localhost:8000/blog/see/${article.id}',
          ),
          WrappedButton(
            leadingIcon: const LineIcon.thumbsUpAlt(),
            text: article.likesCount,
            snackBarIcon: const LineIcon.thumbsUpAlt(
              color: Colors.white60,
            ),
            onClickedSnackBarText: 'post liked',
            unClickedSnackBarText: 'you disliked this post',
            requestUrl: 'http://localhost:8000/blog/like/${article.id}',
          )
        ]),
      );
    }

    return GestureDetector(
      onTap: () {
        debugPrint('clicked');
      },
      child: Container(
        height: widget.podHeight,
        width: widget.podWidth,
        color: Colors.white54,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Column(
          children: [
            creatorHeader(context),
            const SizedBox(height: 4),
            image(context),
            textBody(context),
            bottom(context)
          ],
        ),
      ),
    );
  }
}