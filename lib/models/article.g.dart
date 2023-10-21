// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String? ?? '',
      pictureUrl: json['pictureUrl'] as String? ?? '',
      likesCount: json['likesCount'] as String? ?? '',
      viewsCount: json['viewsCount'] as String? ?? '',
      commentCount: json['commentCount'] as String? ?? '',
      creator: json['creator'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'pictureUrl': instance.pictureUrl,
      'likesCount': instance.likesCount,
      'viewsCount': instance.viewsCount,
      'commentCount': instance.commentCount,
      'content': instance.content,
      'creator': instance.creator,
    };
