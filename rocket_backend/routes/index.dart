import 'package:dart_frog/dart_frog.dart';

// var db = OpenConnection().connect();

Response onRequest(RequestContext context) {
  return Response(body: 'Welcome to Dart Frog!');
}
