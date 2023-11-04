import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';
part 'shorts.g.dart';

@JsonSerializable()
class Shorts {
  Shorts({
    this.id = Uuid.NAMESPACE_DNS,
    this.creator = '',
    this.text = '',
    this.picture = '',
    this.likesCount = '0',
    this.commentCount = '0',
  });

  String id;
  String creator;
  String text;
  String picture;
  String likesCount;
  String commentCount;

  factory Shorts.fromJson(Map<String, dynamic> json) => _$ShortsFromJson(json);
  Map<String, dynamic> toJson() => _$ShortsToJson(this);
}
