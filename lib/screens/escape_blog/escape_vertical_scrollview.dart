import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import './rocket_pod.dart';
import '../../models/article.dart';
// import './escape_horizontal_scrollview.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EscapeVerticalScrollView extends StatefulWidget {
  const EscapeVerticalScrollView({super.key});

  @override
  State<EscapeVerticalScrollView> createState() =>
      EscapeVerticalScrollViewState();
}

class GetArticle {
  String getPath() {
    return 'http://127.0.0.1:8000/';
  }

  Future<List<Article>> getArticles() async {
    final res = await http.get(Uri.parse(getPath()));

    if (res.statusCode == 200) {
      List json = jsonDecode(res.body);
      // List data = json['name'];
      // print(json);
      return json.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class EscapeVerticalScrollViewState extends State<EscapeVerticalScrollView> {
  List<Article> listOfArticles = <Article>[];

  Future<List<Article>> fetchManyArticles() async {
    // fetch blokb data
    var res = await http.get(Uri.parse('http://127.0.0.1:8000/'));

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
          child: ListView.builder(
              itemCount: listOfArticles.length,
              itemBuilder: (context, index) =>
                  RocketPod(article: listOfArticles[index])),
        ),
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
