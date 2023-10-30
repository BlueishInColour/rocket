import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(RequestContext context) {
  // TODO: implement route handler

  return switch (context.request.method) {
    HttpMethod.get => _getList(context),
    HttpMethod.post => _createList(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

Future<Response> _getList(RequestContext context) async {
  final lists = await context.read<Db>().collection('lists').find().toList();
  return Response.json(body: lists.toString());
}

Future<Response> _createList(RequestContext context) async {
  final body = await context.request.json() as Map<String, dynamic>;
  final name = body['name'] as String?;

  final list = <String, dynamic>{'name': name};

  final result = await context.read<Db>().collection('list').insertOne(list);

  return Response.json(body: {'id': result.id});
//
}
