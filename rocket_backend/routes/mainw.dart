import 'package:mongo_dart/mongo_dart.dart';

String mongourl =
    'mongodb+srv://BlueishInColour:"Oluwapelumide"@testing.ga2xojt.mongodb.net/?retryWrites=true&w=majority';

main() async {
  final db = Db(mongourl);
  final pipeline = AggregationPipelineBuilder()
      .addStage(Match(where.eq('status', 'A').map['\$query']))
      .addStage(
          Group(id: Field('cust_id'), fields: {'total': Sum(Field('amount'))}))
      .build();
  final result =
      await DbCollection(db, 'orders').aggregateToStream(pipeline).toList();
  result.forEach(print);
}
