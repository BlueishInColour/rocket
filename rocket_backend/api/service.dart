// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:dart_frog/dart_frog.dart';
// // import 'package:mongo_dart/mongo_dart.dart';

// String mongourl =
//     'mongodb+srv://BlueishInColour:<password>@testing.ga2xojt.mongodb.net/?retryWrites=true&w=majority';

// class DatabaseService {
//   con() async {
//     final db = await Db(mongourl);
//     return db;
//   }

//   var db = con();

//   //start the database
//   static Future<void> startDb() async {
//     if (db.isConnected == false) {
//       await db.open();
//     }
//   }

//   //close the database
//   static Future<void> closeDb() async {
//     if (db.isConnected == true) {
//       await db.close();
//     }
//   }

//   //collections
//   static final pizzasCollections = db.collection('pizzas');
//   static final ordersCollections = db.collection('orders');

//   // we will use this method to start the database connection and use it in our routes
//   static Future<Response> startConnection(
//     RequestContext context,
//     Future<Response> callBack,
//   ) async {
//     try {
//       await startDb();
//       return await callBack;
//     } catch (e) {
//       return Response.json(
//         statusCode: 500,
//         body: {'message': 'Internal server error'},
//       );
//     }
//   }
// }
