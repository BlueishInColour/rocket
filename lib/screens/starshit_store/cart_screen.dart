import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:line_icons/line_icon.dart';

import '../../models/goods.dart';
import '../../theme/theme.dart';
import 'starship_pod.dart';
import 'package:http/http.dart' as http;

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // Future<String> futureFunction(){return await '' ;}

    Future<List<Goods>> fetchManyGoodss() async {
      // fetch blokb data
      var res = await http.get(Uri.parse('http://127.0.0.1:8000/goods/fit'));

      if (res.statusCode == 200) {
        // decode data`
        List json = jsonDecode(res.body);

// map each data in the list to a class
        Iterable<Goods> iterable = json.map((e) => Goods.fromJson(e));

        List<Goods> list = iterable.toList();
        return list;
      } else {
        throw Exception('unable to fetch data');
      }
    }

    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            // backgroundColor: Colors.transparent,
            title: TabBar(
              controller: controller,
              tabs: const [
                Tab(
                  text: 'saved',
                  icon: LineIcon.heart(),
                ),
                Tab(
                  text: 'pre-ordered',
                  icon: LineIcon.history(),
                ),
                Tab(
                  text: 're-sell',
                  icon: LineIcon.retweet(),
                ),
                Tab(
                  text: 'orders',
                  icon: LineIcon.shoppingCart(
                    size: 30,
                  ),
                ),
              ],
            )),
        body: SizedBox(
            height: 700,
            child: TabBarView(controller: controller, children: [
              EachCartScreens(
                getData: fetchManyGoodss(),
              ),
              EachCartScreens(
                getData: fetchManyGoodss(),
              ),
              EachCartScreens(
                getData: fetchManyGoodss(),
              ),
              EachCartScreens(
                getData: fetchManyGoodss(),
              ),
            ])));
  }
}

class EachCartScreens extends StatelessWidget {
  const EachCartScreens(
      {super.key,
      required this.getData,
      this.hideOrder = false,
      this.hidePreorder = false,
      this.hideResell = false,
      this.hideSaved = false,
      this.floatingButton = const SizedBox()});
  final Future<List<Goods>> getData;
  final bool hideSaved;
  final bool hidePreorder;
  final bool hideResell;
  final bool hideOrder;
  final Widget floatingButton;

  // get listOfGoods => null;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData,
        builder: (context, AsyncSnapshot<List<Goods>> snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) =>
                          StarshipPod(goods: snapshot.data![index])),
                ),
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
          ));
        });
  }
}
