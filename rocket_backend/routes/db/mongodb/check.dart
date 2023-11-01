import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(RequestContext context) async {
  const connectString =
      'mongodb+srv://babyboo:Oluwapelumi@testing.ga2xojt.mongodb.net/?retryWrites=true&w=majority';

  final res = await Db.create(connectString);
  //
  if (res.isConnected) {
    return Response(body: 'the db is succesfull connected !');
  } else {
    await res.open();
    return Response(body: 'now getting started to enweijoi');
  }
}
