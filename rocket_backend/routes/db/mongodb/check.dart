import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(RequestContext context) async {
  String connectString =
      'mongodb+srv://babyboo:Oluwapelumi@testing.ga2xojt.mongodb.net/?retryWrites=true&w=majority';

  var res = await Db.create(connectString);
  //
  if (res.isConnected) {
    return Response(body: 'the db is succesfull connected !');
  } else {
    await res.open();
    return Response(body: 'now getting started to enweijoi');
  }
}
