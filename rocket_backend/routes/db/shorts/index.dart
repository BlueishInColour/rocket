import 'dart:io';
import 'package:dart_frog/dart_frog.dart';
import '../../../../lib/models/shorts.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(RequestContext context) {
  //
  final parameters = context.request.uri.queryParameters;

  final id = parameters['id'] ?? '';

  //
  if (id.isNotEmpty) {
    _getOneShorts(context);
  }

  return switch (context.request.method) {
    HttpMethod.get => _getShorts(context),
    HttpMethod.post => _createShorts(context),
    _ => Future.value(Response(statusCode: HttpStatus.methodNotAllowed))
  };
}

Future<Response> _getOneShorts(RequestContext context) async {
  final short = await context.read<Db>().collection('shorts').findOne(['id']);
  return Response.json(body: short.toString());
}

Future<Response> _getShorts(RequestContext context) async {
  final short = await context.read<Db>().collection('shorts').find().toList();
  return Response.json(body: short);
}

Future<Response> _createShorts(RequestContext context) async {
  final shortsJson = await context.request.json() as Map<String, dynamic>;
  //can manipulate the data
  final res =
      await context.read<Db>().collection('shorts').insertOne(shortsJson);

  return Response.json(body: {'id': res.id});
}
