import 'package:dart_frog/dart_frog.dart';
import '../api/service.dart';
import 'package:mongo_dart/mongo_dart.dart';

// var db = OpenConnection().connect();

Response onRequest(RequestContext context) {
  return Response(body: 'Welcome to Dart Frog!');
}
