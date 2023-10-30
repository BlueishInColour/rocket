// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Goods _$GoodsFromJson(Map<String, dynamic> json) => Goods(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      pictureUrl: json['pictureUrl'] as String? ?? '',
      preorderCount: json['preorderCount'] as String? ?? '',
      resellCount: json['resellCount'] as String? ?? '',
      orderCount: json['orderCount'] as String? ?? '',
      salesPrice: json['salesPrice'] as String? ?? '',
      discountedPrice: json['discountedPrice'] as String? ?? '',
      creator: json['creator'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$GoodsToJson(Goods instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pictureUrl': instance.pictureUrl,
      'content': instance.content,
      'preorderCount': instance.preorderCount,
      'resellCount': instance.resellCount,
      'orderCount': instance.orderCount,
      'salesPrice': instance.salesPrice,
      'discountedPrice': instance.discountedPrice,
      'creator': instance.creator,
    };
