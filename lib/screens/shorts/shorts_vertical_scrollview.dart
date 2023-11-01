import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import './shorts_pod.dart';
import 'package:rocket/models/article.dart';
// import './Shorts_horizontal_scrollview.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShortsVerticalScrollView extends StatefulWidget {
  const ShortsVerticalScrollView({super.key});

  @override
  State<ShortsVerticalScrollView> createState() =>
      ShortsVerticalScrollViewState();
}

class GetArticle {
  String getPath() {
    return 'http://127.0.0.1:8080/shorts';
  }

  Future<List<Article>> getArticles() async {
    final res = await http.get(Uri.parse(getPath()));

    if (res.statusCode == 200) {
      List json = jsonDecode(res.body);
      // List data = json['name'];
      if (kDebugMode) {
        print(json);
      }
      return json.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class ShortsVerticalScrollViewState extends State<ShortsVerticalScrollView> {
  List<Article> listOfArticles = <Article>[];
  final pageStorage = PageStorageBucket();
  Future<List<Article>> fetchManyArticles() async {
    // fetch blokb data
    var res = await http.get(Uri.parse('http://127.0.0.1:8080/shorts'));

    if (res.statusCode == 200) {
      // decode data`
      List json = jsonDecode(res.body);

// map each data in the list to a class
      Iterable<Article> iterable = json.map((e) => Article.fromJson(e));

      setState(() {
        listOfArticles.addAll(iterable);
      });
      // print(listOfArticles.length);

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
            width: 500,
            child: PageStorage(
              bucket: pageStorage,
              child: ListView.builder(
                  key: PageStorageKey<String>('pageOne'),
                  itemCount: listOfArticles.length,
                  itemBuilder: (context, index) =>
                      ShortsPod(article: listOfArticles[index])),
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
