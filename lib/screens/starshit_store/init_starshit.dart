import 'package:flutter/material.dart';
import './starship_vertical_scrollview.dart';
import '../../utils/floating_button.dart';
// import '../../ut/ils/utils_functions.dart';
import 'package:line_icons/line_icon.dart';
import './cart_screen.dart';
import '../../theme/theme.dart';

class StarShitScreen extends StatefulWidget {
  const StarShitScreen({super.key});

  @override
  State<StarShitScreen> createState() => StarShitScreenState();
}

class StarShitScreenState extends State<StarShitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingButton(
            onPressed: () {
              showModalBottomSheet(
                  // anchorPoint: Offset(200, 500),
                  isDismissible: true,
                  context: context,
                  showDragHandle: true,
                  enableDrag: true,
                  backgroundColor: lPalette.primary,
                  builder: (context) => const CartScreen());
            },
            icon: const LineIcon.shoppingCart(
              size: 35,
            )),
        body: const StarshipVerticalScrollView());
  }
}
