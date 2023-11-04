// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shorts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shorts _$ShortsFromJson(Map<String, dynamic> json) => Shorts(
      id: json['id'] as String? ?? '',
      creator: json['creator'] as String? ?? '',
      text: json['text'] as String? ?? '',
      picture: json['picture'] as String? ?? '',
      likesCount: json['likesCount'] as String? ?? '0',
      commentCount: json['commentCount'] as String? ?? '0',
    );

Map<String, dynamic> _$ShortsToJson(Shorts instance) => <String, dynamic>{
      'id': instance.id,
      'creator': instance.creator,
      'text': instance.text,
      'picture': instance.picture,
      'likesCount': instance.likesCount,
      'commentCount': instance.commentCount,
    };
