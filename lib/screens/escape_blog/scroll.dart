import 'package:flutter/material.dart';
// import './escape_horizontal_scrollview.dart';
import './escape_vertical_scrollview.dart';

class Scroll extends StatefulWidget {
  const Scroll({super.key});

  @override
  State<Scroll> createState() => ScrollState();
}

class ScrollState extends State<Scroll> {
  final pageBucket = PageStorageBucket();
  @override
  Widget build(BuildContext context) {
    return EscapeVerticalScrollView(
      bucket: pageBucket,
    );
  }
}
