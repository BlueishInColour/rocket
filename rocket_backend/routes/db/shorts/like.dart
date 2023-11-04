import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import '../../../../lib/models/shorts.dart';
import 'package:mongo_dart/mongo_dart.dart';

Future<Response> onRequest(
  RequestContext context,
) async {
  // TODO: implement route handler
  final id = await context.request.body();

  return Response(statusCode: 200);
}
