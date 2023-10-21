import 'package:json_annotation/json_annotation.dart';
// import 'package:json_serializable/json_serializable.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  Comment(
      {this.content = '',
      this.creator = '',
      this.creatorPicture = '',
      // this.time =  DateTime.now(),
      this.postId = ''});

  String postId;
  String creator;
  String creatorPicture;
  final String content;
  DateTime time = DateTime.now();

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
