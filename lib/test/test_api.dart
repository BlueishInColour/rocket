import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Fastapi extends StatefulWidget {
  const Fastapi({super.key});

  @override
  State<Fastapi> createState() => FastapiState();
}

class GetUser {
  String getPath() {
    return 'http://127.0.0.1:8000/test/recieve';
  }

  Future<List<User>> getUsers() async {
    final res = await http.get(Uri.parse(getPath()));

    if (res.statusCode == 200) {
      List json = jsonDecode(res.body);
      // List data = json['name'];
      print(json);
      return json.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}

class FastapiState extends State<Fastapi> {
  // //
  // Future<List<User>> getData() async {
  //   // final dio = Dio();
  //   debugPrint('about to get data');
  //   List<User> listOfUsers = <User>[];
  //   String url = 'http://127.0.0.1:8000/test/recieve';
  //   Uri uri = Uri(
  //       scheme: 'http', host: '127.0.0.1', port: 8000, path: '/test/recieve');
  //   // Map<String,dynamic> res =await dio.get(url);
  //   final res = await http.get(uri);
  //   if (res.statusCode == 200) {
  //     var json = jsonDecode(res.body);
  // //  return json
  //   } else
  //     (throw Exception('unable to fetch data'));
  // }

  @override
  Widget build(BuildContext context) {
    ListTile _tile(String title, String subtitle, IconData icon) {
      return ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
    }

    ListView _employees(data) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(child: _tile(data[index].name, '', Icons.work));
          });
    }

    FutureBuilder _employeesData() {
      return FutureBuilder<List<User>>(
        future: GetUser().getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            List<User> data = snapshot.data!;
            return _employees(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      );
    }

    return Scaffold(
      body: Column(
        children: [
          //this is for future builder
          Expanded(
            child: Center(child: _employeesData()),
          ),

          //this is for listview builder
          Expanded(
            child: Container(color: Colors.green),
          ),
        ],
      ),
    );
  }
}
