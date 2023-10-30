import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:line_icons/line_icon.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:rocket/theme/theme.dart';

import 'package:rocket/models/goods.dart';
import '../../utils/wrapped_buttons.dart';
// import '../../utils/write_comment.dart';
// import '../../utils/utils_functions.dart';

class StarshipPod extends StatefulWidget {
  const StarshipPod(
      {super.key,
      this.podHeight = 200,
      this.podWidth = 150,
      required this.goods});

  final double podHeight;
  final double podWidth;
  final Goods goods;
  @override
  State<StarshipPod> createState() => StarshipPodState();
}

class StarshipPodState extends State<StarshipPod> {
  bool showDiscription = false;
  @override
  Widget build(BuildContext context) {
    final goods = widget.goods;

    Widget image(context) {
      return GestureDetector(
        onTap: () {
          setState(() {
            showDiscription = !showDiscription;
          });
        },
        child: Expanded(
          child: SizedBox(
            width: 450,
            // height: 250,
            child: CachedNetworkImage(
                imageUrl: goods.pictureUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Container(
                    height: 250,
                    color: lPalette.primary,
                    child: const Center(
                        child:
                            CircularProgressIndicator(color: Colors.black45)),
                  );
                },
                errorWidget: (_, __, ___) => Container(
                    height: 250,
                    color: lPalette.primary,
                    child: const Center(
                      child: Text('unable to load image'),
                    ))),
          ),
        ),
      );
    }

    Widget textBody(context) {
      return GestureDetector(
        onTap: () {
          setState(() {
            showDiscription = !showDiscription;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          child: Text(goods.title,
              maxLines: 3,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
        ),
      );
    }

    Widget description(context) {
      return GestureDetector(
          onTap: () {
            setState(() {
              showDiscription = !showDiscription;
            });
          },
          child: Text(goods.content));
    }

    Widget bottom(context) {
      return Container(
        margin: const EdgeInsets.all(5),
        child: Row(children: [
          WrappedButton(
            badgeColor: const Color.fromRGBO(0, 0, 0, 0),
            leadingIcon: const LineIcon.heart(),
            snackBarIcon: const LineIcon.heart(color: Colors.white60),
            onClickedSnackBarText: 'you saved this for later',
            unClickedSnackBarText: 'you un-saved this item',
          ),
          const Expanded(child: SizedBox()),
          WrappedButton(
              badgeColor: Colors.red,
              text: goods.preorderCount,
              leadingIcon: const LineIcon.history(),
              snackBarIcon: const LineIcon.history(color: Colors.white60),
              onClickedSnackBarText:
                  'added to pre-order list, click cart to checkout',
              unClickedSnackBarText: 'removed from pre-order list',
              trailingText: 'pre-order'),
          WrappedButton(
            badgeColor: Colors.red,
            text: goods.resellCount,
            leadingIcon: const LineIcon.retweet(),
            trailingText: 're-sell',
            snackBarIcon: const LineIcon.retweet(color: Colors.white60),
            onClickedSnackBarText:
                'added to re-sell list, click cart icon to complete action',
            unClickedSnackBarText: 'removed from re-sell list',
          ),
          const Expanded(child: SizedBox()),
          WrappedButton(
            badgeColor: Colors.red,
            text: goods.orderCount,
            leadingIcon: const LineIcon.shoppingCart(),
            snackBarIcon: const LineIcon.shoppingCart(color: Colors.white60),
            onClickedSnackBarText:
                'added to order list, click cart to complete order',
            unClickedSnackBarText: 'removed from order list',
          ),
          const SizedBox(
            width: 5,
          )
        ]),
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      // height: widget.podHeight,
      width: widget.podWidth,
      color: Colors.white54,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          image(context),
          textBody(context),
          showDiscription ? description(context) : const SizedBox(),
          bottom(context),
        ],
      ),
    );
  }
}
