// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      id: json['id'] as String? ?? 'nokenok',
      title: json['title'] as String? ?? '',
      pictureUrl: json['pictureUrl'] as String? ?? '',
      likesCount: json['likesCount'] as String? ?? '0',
      viewsCount: json['viewsCount'] as String? ?? '0',
      commentCount: json['commentCount'] as String? ?? '0',
      creator: json['creator'] as String? ?? 'blueishInColour',
      creatorChannel: json['creatorChannel'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'pictureUrl': instance.pictureUrl,
      'likesCount': instance.likesCount,
      'viewsCount': instance.viewsCount,
      'commentCount': instance.commentCount,
      'content': instance.content,
      'creator': instance.creator,
      'creatorChannel': instance.creatorChannel,
    };
