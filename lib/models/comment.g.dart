// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      content: json['content'] as String? ?? '',
      creator: json['creator'] as String? ?? '',
      creatorPicture: json['creatorPicture'] as String? ?? '',
      postId: json['postId'] as String? ?? '',
    )..time = DateTime.parse(json['time'] as String);

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'postId': instance.postId,
      'creator': instance.creator,
      'creatorPicture': instance.creatorPicture,
      'content': instance.content,
      'time': instance.time.toIso8601String(),
    };
