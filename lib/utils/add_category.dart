import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rocket/utils/utils_functions.dart';
import 'package:http/http.dart' as http;
import '../theme/theme.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => AddCategoryState();
}

class AddCategoryState extends State<AddCategory> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddCategoryscreen();
            });
      },
      icon: Icon(Icons.add, color: Colors.green),
    );
  }
}

// import 'package:flutter/material.dart';

class AddCategoryscreen extends StatefulWidget {
  const AddCategoryscreen({super.key});

  @override
  State<AddCategoryscreen> createState() => AddCategoryscreenState();
}

class AddCategoryscreenState extends State<AddCategoryscreen> {
  TextEditingController categoryName = TextEditingController();
  TextEditingController categoryDescription = TextEditingController();
  onPressed() async {
    debugPrint('adding category ....');
    var res = await http.post(Uri.parse(
        'http://localhost:8000/blog/add_category/?name=$categoryName&description=$categoryDescription'));
    if (res.statusCode == 200) {
      print('successful');
    } else {
      print('unsuccessful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lPalette.primary,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(hintText: 'new category name'),
          ),
          SizedBox(height: 15),
          SizedBox(
              height: 100,
              child: Expanded(
                  child: TextField(
                decoration: InputDecoration(
                    hintText: 'short description of new category'),
              ))),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white10)),
                onPressed: onPressed,
                child: Text('add',
                    style: TextStyle(fontSize: 15, color: Colors.black54)),
              )
            ],
          ),
          SizedBox(height: 70),
          Center(
              child: Text(
                  'Quill will review your request, if its valid, it will be added asap',
                  style: GoogleFonts.pacifico(color: Colors.black45)))
        ]),
      ),
    );
  }
}
