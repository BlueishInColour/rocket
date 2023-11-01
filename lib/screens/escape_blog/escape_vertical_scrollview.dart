import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import './rocket_pod.dart';
import 'package:rocket/models/article.dart';
// import './escape_horizontal_scrollview.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EscapeVerticalScrollView extends StatefulWidget {
  const EscapeVerticalScrollView(
      {super.key, required this.bucket, this.category = 'all'});
  final String category;
  final PageStorageBucket bucket;
  @override
  State<EscapeVerticalScrollView> createState() =>
      EscapeVerticalScrollViewState();
}

class EscapeVerticalScrollViewState extends State<EscapeVerticalScrollView> {
  List<Article> listOfArticles = <Article>[];

  Future<List<Article>> fetchManyArticles() async {
    // fetch blokb data
    var res = await http.get(Uri.parse('http://127.0.0.1:8080/blog'));

    if (res.statusCode == 200) {
      // decode data`
      List json = jsonDecode(res.body);

// map each data in the list to a class
      Iterable<Article> iterable = json.map((e) => Article.fromJson(e));

      setState(() {
        listOfArticles.addAll(iterable);
      });
      if (kDebugMode) {
        print(listOfArticles.length);
      }

      List<Article> list = iterable.toList();
      return list;
    } else {
      throw Exception('unable to fetch data');
    }
  }

  @override
  initState() {
    super.initState();
    fetchManyArticles();
  }

  @override
  Widget build(BuildContext context) {
    if (listOfArticles.isNotEmpty) {
      return Center(
        child: SizedBox(
            width: 450,
            child: PageStorage(
              bucket: widget.bucket,
              child: ListView.builder(
                  key: PageStorageKey<String>(widget.category),
                  itemCount: listOfArticles.length,
                  itemBuilder: (context, index) =>
                      RocketPod(article: listOfArticles[index])),
            )),
      );
    }
    return Center(
      child: CircleAvatar(
        backgroundColor: Colors.white54,
        child: CircularProgressIndicator(
          color: lPalette.primary,
        ),
      ),
    );
  }
}
