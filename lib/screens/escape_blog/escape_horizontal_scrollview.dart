import 'package:flutter/material.dart';
import './rocket_pod.dart';
import '../../../models/article.dart';
// import 'package:line_icons/line_icons.dart';
import '../../utils/escape_icon.dart';
// import 'package:rocket/models/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EscapeHorizontalScrollView extends StatefulWidget {
  const EscapeHorizontalScrollView({super.key});

  @override
  State<EscapeHorizontalScrollView> createState() =>
      EscapeHorizontalScrollViewState();
}

class EscapeHorizontalScrollViewState
    extends State<EscapeHorizontalScrollView> {
  List<Article> listOfArticles = <Article>[];

  fetchManyArticles() async {
    // fetch blokb data
    var res =
        await http.get(Uri.parse('http://127.0.0.1:8000/search/articles'));

    if (res.statusCode == 200) {
      // decode data`
      List json = jsonDecode(res.body);

// map each data in the list to a class
      Iterable<Article> list = json.map((e) => Article.fromJson(e));

      setState(() {
        listOfArticles.addAll(list);
      });
      // debugPrint(listOfArticles.length);
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
    return Column(
      children: [
        const EscapeIcon(),
        SizedBox(
            height: 450,
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, _) {
                  return RocketPod(
                      podHeight: 200, podWidth: 300, article: Article());
                },
              ),
            )),
      ],
    );
  }
}
