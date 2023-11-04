import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import './shorts_pod.dart';
import 'package:rocket/models/shorts.dart';
// import './Shorts_horizontal_scrollview.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ShortsVerticalScrollView extends StatefulWidget {
  const ShortsVerticalScrollView({super.key, required this.bucket});
  final PageStorageBucket bucket;
  @override
  State<ShortsVerticalScrollView> createState() =>
      ShortsVerticalScrollViewState();
}

class GetShorts {
  String getPath() {
    return 'http://127.0.0.1:8080/shorts';
  }

  Future<List<Shorts>> getShortss() async {
    final res = await http.get(Uri.parse(getPath()));

    if (res.statusCode == 200) {
      List json = jsonDecode(res.body);
      // List data = json['name'];
      if (kDebugMode) {
        print(json);
      }
      return json.map((shorts) => Shorts.fromJson(shorts)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class ShortsVerticalScrollViewState extends State<ShortsVerticalScrollView> {
  List<Shorts> listOfShorts = <Shorts>[];
  final pageStorage = PageStorageBucket();
  Future<List<Shorts>> fetchManyShortss() async {
    // fetch blokb data
    var res = await http.get(Uri.parse('http://127.0.0.1:8080/db/shorts'));

    if (res.statusCode == 200) {
      // decode data`
      List json = jsonDecode(res.body);

// map each data in the list to a class
      Iterable<Shorts> iterable = json.map((e) => Shorts.fromJson(e));

      setState(() {
        listOfShorts.addAll(iterable);
      });
      // print(listOfShorts.length);

      List<Shorts> list = iterable.toList();

      return list;
    } else {
      throw Exception('unable to fetch data');
    }
  }

  @override
  initState() {
    super.initState();
    fetchManyShortss();
  }

  @override
  Widget build(BuildContext context) {
    if (listOfShorts.isNotEmpty) {
      return Center(
        child: SizedBox(
            width: 500,
            child: PageStorage(
              bucket: widget.bucket,
              child: ListView.builder(
                  key: PageStorageKey<String>('shortsPage'),
                  itemCount: listOfShorts.length,
                  itemBuilder: (context, index) =>
                      ShortsPod(shorts: listOfShorts[index])),
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
