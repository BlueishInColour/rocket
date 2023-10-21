import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  String id;
  String title;
  String pictureUrl;
  String likesCount;
  String viewsCount;
  String commentCount;
  String content; //prropebaly in wscgosi format for web pages in html
  String creator;
  // DateTime time = DateTime.now();

  Article({
    this.id = 'nokenok',
    this.title = '',
    this.pictureUrl = '',
    this.likesCount = '',
    this.viewsCount = '',
    this.commentCount = '',
    this.creator = '',
    this.content = '',
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
