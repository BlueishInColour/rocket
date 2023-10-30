import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import './starship_pod.dart';
import 'package:rocket/models/goods.dart';
import 'dart:convert';
// import 'package:line_icons/line_icons.dart';
// import '../../utils/escape_icon.dart';
import 'package:http/http.dart' as http;

class StarshipVerticalScrollView extends StatefulWidget {
  const StarshipVerticalScrollView({super.key});

  @override
  State<StarshipVerticalScrollView> createState() =>
      StarshipVerticalScrollViewState();
}

class StarshipVerticalScrollViewState
    extends State<StarshipVerticalScrollView> {
  List<Goods> listOfGoods = <Goods>[];

  Future<List<Goods>> fetchManyGoodss() async {
    // fetch blokb data
    var res = await http.get(Uri.parse('http://127.0.0.1:8080/shop'));

    if (res.statusCode == 200) {
      // decode data`
      List json = jsonDecode(res.body);

// map each data in the list to a class
      Iterable<Goods> iterable = json.map((e) => Goods.fromJson(e));

      setState(() {
        listOfGoods.addAll(iterable);
      });
      if (kDebugMode) {
        print(listOfGoods.length);
      }

      List<Goods> list = iterable.toList();
      return list;
    } else {
      throw Exception('unable to fetch data');
    }
  }

  @override
  initState() {
    super.initState();
    fetchManyGoodss();
  }

  @override
  Widget build(BuildContext context) {
    if (listOfGoods.isNotEmpty) {
      return Center(
        child: SizedBox(
          width: 450,
          child: ListView.builder(
              itemCount: listOfGoods.length,
              itemBuilder: (context, index) =>
                  StarshipPod(goods: listOfGoods[index])),
        ),
      );
    }
    return Center(
      child: SizedBox(
        width: 450,
        child: CircleAvatar(
          backgroundColor: Colors.white54,
          child: CircularProgressIndicator(color: lPalette.primary),
        ),
      ),
    );
  }
}
