import 'package:flutter/material.dart';
import 'package:rocket/screens/shorts/shorts_quill.dart';
import './shorts_vertical_scrollview.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => ShortsScreenState();
}

class ShortsScreenState extends State<ShortsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ShortsQuill(),
      ),
      body: const ShortsVerticalScrollView(),
    );
  }
}
