import 'package:json_annotation/json_annotation.dart';

part 'pay.g.dart';

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
  String creatorChannel;
  // DateTime time = DateTime.now();

  Article({
    this.id = 'nokenok',
    this.title = '',
    this.pictureUrl = '',
    this.likesCount = '0',
    this.viewsCount = '0',
    this.commentCount = '0',
    this.creator = 'blueishInColour',
    this.creatorChannel = '',
    this.content = '',
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}


///media/blueish/dev/rocket/models/article.dart
///
///models/user.g.dart