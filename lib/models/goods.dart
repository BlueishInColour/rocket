import 'package:json_annotation/json_annotation.dart';

part 'goods.g.dart';

@JsonSerializable()
class Goods {
  String id;
  String title;
  String pictureUrl;
  String content;
  //
  String preorderCount;
  String resellCount;
  String orderCount;
  //
  String salesPrice;
  String discountedPrice;
  // String commentCount;
  //prropebaly in wscgosi format for web pages in html
  String creator;
  // DateTime time = DateTime.now();

  Goods({
    this.id = '',
    this.title = '',
    this.pictureUrl = '',
    this.preorderCount = '',
    this.resellCount = '',
    this.orderCount = '',
    this.salesPrice = '',
    this.discountedPrice = '',
    // this.commentCount = '',
    this.creator = '',
    this.content = '',
  });

  factory Goods.fromJson(Map<String, dynamic> json) => _$GoodsFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsToJson(this);
}
