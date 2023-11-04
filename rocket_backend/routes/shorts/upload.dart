import 'package:dart_frog/dart_frog.dart';

Response onRequest(RequestContext context) {
  //
  final parameters = context.request.uri.queryParameters;

  final picture = parameters['picture'] ?? '';
  final text = parameters['text'];

  //
  return Response(statusCode: 200, body: '$picture $text');
}
