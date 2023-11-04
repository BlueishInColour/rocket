import 'package:flutter/material.dart';
import 'package:rocket/screens/shorts/shorts_quill.dart';
import './shorts_vertical_scrollview.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key, required this.bucket});
  final PageStorageBucket bucket;
  @override
  State<ShortsScreen> createState() => ShortsScreenState();
}

class ShortsScreenState extends State<ShortsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return PageStorage(
        bucket: widget.bucket,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[100],
            toolbarHeight: 55,
            title: const ShortsQuill(),
          ),
          body: ShortsVerticalScrollView(bucket: widget.bucket),
        ));
  }
}
